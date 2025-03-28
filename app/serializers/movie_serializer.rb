class MovieSerializer
  include JSONAPI::Serializer
  set_type :movie
  attributes :title, :vote_average 

  attribute :id do |movie|
    movie.tmdb_id.to_s
  end
end