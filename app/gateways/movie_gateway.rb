class MovieGateway
  def self.top_rated
    response = conn.get("/3/movie/top_rated", { api_key: Rails.application.credentials.tmdb[:key] })

    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end
end