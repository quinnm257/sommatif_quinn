class CreateGears < ActiveRecord::Migration[8.0]
  def change
    create_table :gears do |t|
      t.string :item
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
