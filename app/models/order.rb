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

  # validates_length_of : order_phone, :is => 10
  validates_numericality_of :order_phone, :only_integer => true
  validates :order_address, presence: true
  validates :order_name, presence: true

  before_save :setup_total_amount
  after_create :consume_stock

  def total
    gold_count * product.gold_price + silver_count * product.silver_price + rose_count * product.rose_price
  end

  protected

  def setup_total_amount
    self.total_amount = self.total
  end

  def consume_stock
    self.product.update(
         gold_stock:   product.gold_stock - gold_count,
         rose_stock:   product.rose_stock - rose_count,
         silver_stock: product.silver_stock - silver_count)
  end

  def initial
    status = "initial"
  end

  def initial!
    update(status: "initial")
  end

  def complete!
    update(status: "completed")
  end

  def payment_failed!
    update(status: "payment_failed")
  end

end
