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

class Order < ActiveRecord::Base
  belongs_to :product

  validates_length_of :order_phone, :is => 10
  validates_numericality_of :order_phone, :only_integer => true

  before_save :setup_total
  after_create :consume_stock

  def total
    self.gold_count * self.product.gold_price + self.silver_count * self.product.silver_price + self.rose_count * self.product.rose_price
  end

  protected

  def setup_total
    self.total_amount = self.total
  end

  def consume_stock
    gold_in_stock = self.product.gold_stock
    rose_in_stock = self.product.rose_stock
    silver_in_stock = self.product.silver_stock
    gold_in_stock = gold_in_stock - self.gold_count
    rose_in_stock = rose_in_stock - self.rose_count
    silver_in_stock = silver_in_stock - self.silver_count
    self.product.update(gold_stock: gold_in_stock, rose_stock: rose_in_stock, silver_stock: silver_in_stock)

  end

end
