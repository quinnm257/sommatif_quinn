json.extract! album_track, :id, :album_id, :track_name, :track_number, :created_at, :updated_at
json.url album_track_url(album_track, format: :json)
