class Product < ActiveRecord::Base
  has_many :orders

  validates_numericality_of :gold_stock, :rose_stock, :silver_stock,  :only_integer => true
  validates_numericality_of :gold_price, :rose_price, :silver_price,  :only_integer => true, :greater_than => 1

  def enough?(color, qty)
    self.public_send("#{color}_stock") - qty >= 0
  end



end
