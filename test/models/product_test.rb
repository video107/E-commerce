# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  gold_stock   :integer          default("0")
#  rose_stock   :integer          default("0")
#  silver_stock :integer          default("0")
#  gold_price   :integer          default("50")
#  rose_price   :integer          default("50")
#  silver_price :integer          default("50")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
