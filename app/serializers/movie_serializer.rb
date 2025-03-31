class MovieSerializer
  include JSONAPI::Serializer
  set_type :movie
  set_id :tmdb_id
  attributes :title, :vote_average 

  attribute :id do |movie|
    movie.tmdb_id.to_s
  end
end