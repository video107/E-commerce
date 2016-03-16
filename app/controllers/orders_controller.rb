class OrdersController < ApplicationController

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
    #code
  end

  def pay2go_notify
    notification = ActiveMerchant::Billing::Integrations::Pay2go::Notification.new(request.raw_post)

    @order = Order.find_by_number(notification.merchant_order_no)

    if notification.status && notification.checksum_ok?
      @order.complete!
    else
      @order.payment_failed!
    end

    render text: '1|OK', status: 200
  end

  private

  def order_params
    params.require(:order).permit(:order_name, :order_phone, :order_email,
                                  :order_address, :rose_count, :gold_count,
                                  :silver_count, :payment_method, :status)
  end

end
