require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "notify_contact" do
    mail = UserMailer.notify_contact
    assert_equal "Notify contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_order" do
    mail = UserMailer.notify_order
    assert_equal "Notify order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
