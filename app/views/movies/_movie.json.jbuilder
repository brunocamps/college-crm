json.extract! movie, :id, :name, :duration, :user_id, :classroom_id, :created_at, :updated_at
json.url movie_url(movie, format: :json)
