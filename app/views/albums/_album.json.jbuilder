json.extract! album, :id, :title, :artist_id, :release_year, :genre_id, :created_at, :updated_at
json.url album_url(album, format: :json)
