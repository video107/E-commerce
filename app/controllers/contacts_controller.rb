class ContactsController < ApplicationController

  def index
    @contact = Contact.new
    @order = Order.new
    @product = Product.first
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save!
      UserMailer.notify_contact(@contact).deliver_later!
      flash[:success] = "收到您的問題,會盡快處理"
      redirect_to root_path
    else
      redirect :back
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end
