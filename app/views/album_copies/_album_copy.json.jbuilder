json.extract! album_copy, :id, :album_id, :media_type, :condition, :price, :created_at, :updated_at
json.url album_copy_url(album_copy, format: :json)
