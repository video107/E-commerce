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

class Product < ActiveRecord::Base
  has_many :orders

  validates_numericality_of :gold_stock, :rose_stock, :silver_stock,  :only_integer => true
  validates_numericality_of :gold_price, :rose_price, :silver_price,  :only_integer => true, :greater_than => 1

  def enough?(color, qty)
    self.public_send("#{color}_stock") - qty >= 0
  end



end
