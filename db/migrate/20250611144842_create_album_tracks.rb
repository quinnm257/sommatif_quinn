class CreateAlbumTracks < ActiveRecord::Migration[8.0]
  def change
    create_table :album_tracks do |t|
      t.references :album, null: false, foreign_key: true
      t.string :track_name
      t.integer :track_number

      t.timestamps
    end
  end
end
