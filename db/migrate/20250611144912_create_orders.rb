class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.date :order_date
      t.decimal :Total_price

      t.timestamps
    end
  end
end
