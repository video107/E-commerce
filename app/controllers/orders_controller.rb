class OrdersController < ApplicationController

  def create
    @product = Product.first
    @order = @product.orders.new(order_params)
    if Product.all_enough?(@order.gold_count, @order.rose_count, @order.silver_count)
      if @order.save!
        # render :show
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

  private

  def order_params
    params.require(:order).permit(:order_name, :order_phone, :order_email,
                                  :order_address, :rose_count, :gold_count,
                                  :silver_count, :payment_method, :status)
  end

end
