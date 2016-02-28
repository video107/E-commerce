class AddProductIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :product_id, :integer
    add_column :orders, :total_amount, :integer, :default => 0
  end
end
