# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/notify_contact
  def notify_contact
    UserMailer.notify_contact
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/notify_order
  def notify_order
    UserMailer.notify_order
  end

end
