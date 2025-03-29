class MovieData
  attr_reader :tmdb_id,
              :title,
              :vote_average

  def initialize(data)
    @tmdb_id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
  end
end