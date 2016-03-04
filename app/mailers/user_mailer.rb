class UserMailer < ApplicationMailer

  def notify_contact(contact)
    @contact = contact
    mail( :to => "streamcircle2015@gmail.com", :subject => "#{@contact.name}的feedback")
  end

  def notify_order(order)
    @order = order
    mail( :to => "#{@order.order_email}",:bcc => "streamcircle2015@gmail.com", :subject => "#{@order.order_name}訂購資訊")
  end



end
