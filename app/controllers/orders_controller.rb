class OrdersController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.new(order_params)
    if @product.enough?("gold", @order.gold_count) && @product.enough?("rose", @order.gold_count) && @product.enough?("silver", @order.gold_count)
      if @order.save!
        flash[:notice] = "購買需求已送出, 我們會盡快處理您的訂單"
        UserMailer.notify_order(@order).deliver_later!
        redirect_to root_path
      else
        redirect_to :back
        flash[:alert] = "需求未送出,請重新檢查您的資料"
      end
    else
      flash[:alert] = "產品數量不夠, 請重新選取數量"
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
