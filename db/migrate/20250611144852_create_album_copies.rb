class CreateAlbumCopies < ActiveRecord::Migration[8.0]
  def change
    create_table :album_copies do |t|
      t.references :album, null: false, foreign_key: true
      t.string :media_type
      t.string :condition
      t.decimal :price

      t.timestamps
    end
  end
end
