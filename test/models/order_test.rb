# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  order_name     :string(255)
#  order_phone    :string(255)
#  order_address  :text(65535)
#  order_email    :string(255)
#  payment_method :string(255)
#  status         :string(255)
#  gold_count     :integer          default("0")
#  rose_count     :integer          default("0")
#  silver_count   :integer          default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :integer
#  total_amount   :integer          default("0")
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
