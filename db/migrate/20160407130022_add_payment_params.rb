class AddPaymentParams < ActiveRecord::Migration
  def change
    add_column :orders, :payment_params, :text
  end
end
