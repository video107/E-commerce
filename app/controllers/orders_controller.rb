class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:pay2go_notify]

  def create
    @product = Product.first
    @order = @product.orders.new(order_params)
    if Product.all_enough?(@order.gold_count, @order.rose_count, @order.silver_count)
      @order.initial
      if @order.save!
        respond_to do |format|
          format.js { render :show}
        end
      else
        redirect_to :back
        flash[:alert] = "需求未送出,請重新檢查您的資料"
      end
    else
      flash[:alert] = "產品數量不夠, 請重新選取數量"
      redirect_to root_path
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to :back
    flash[:alert] = "需求未送出,請重新檢查您的資料"
  end

  def show

  end

  def pay2go_notify        
    @order = Order.find(params['MerchantOrderNo'])
    @order.payment_method = params['PaymentType']
    @order.payment_params = params
    if params['Status'] == 'SUCCESS'
      @order.complete!
    elsif params['Status'] == 'CUSTOM'
      @order.complete!
    else
      @order.payment_failed!
    end

    render text: '1|OK', status: 200
  end

  def result
    @order = Order.find(params[:id])
    if @order.status != "completed"
      flash[:notice] = "謝謝你，付款狀態確認中"
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_name, :order_phone, :order_email,
                                  :order_address, :rose_count, :gold_count,
                                  :silver_count, :payment_method, :status)
  end

end
