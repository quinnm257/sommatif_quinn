class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :biography
      t.integer :debut_year
      t.string :country

      t.timestamps
    end
  end
end
