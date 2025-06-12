class AddReleaseYearToAlbums < ActiveRecord::Migration[8.0]
  def change
    add_column :albums, :release_year, :integer
  end
end
