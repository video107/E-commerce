class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :gold_stock, :default => 0
      t.integer :rose_stock, :default => 0
      t.integer :silver_stock, :default => 0
      t.integer :gold_price, :default => 50
      t.integer :rose_price, :default => 50
      t.integer :silver_price, :default => 50

      t.timestamps null: false
    end
    change_column :orders, :gold_count, :integer, :default => 0
    change_column :orders, :silver_count, :integer, :default => 0
    change_column :orders, :rose_count, :integer, :default => 0
  end
end
