json.extract! comic, :id, :title, :cover, :user_id, :genre, :created_at, :updated_at
json.url comic_url(comic, format: :json)
