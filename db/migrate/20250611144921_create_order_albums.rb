class CreateOrderAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :order_albums do |t|
      t.references :order, null: false, foreign_key: true
      t.references :album_copy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
