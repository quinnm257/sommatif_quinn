json.extract! artist, :id, :name, :biography, :debut_year, :country, :created_at, :updated_at
json.url artist_url(artist, format: :json)
