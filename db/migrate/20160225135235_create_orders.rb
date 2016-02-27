class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_name
      t.string :order_phone
      t.text :order_address
      t.string :order_email
      t.string :payment_method
      t.string :status
      t.integer :gold_count
      t.integer :rose_count
      t.integer :silver_count

      t.timestamps null: false
    end
  end
end
