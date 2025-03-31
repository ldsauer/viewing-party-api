class MovieGateway
  def self.top_rated
    response = conn.get("/3/movie/top_rated") do |req|
      req.params[:api_key] = Rails.application.credentials.tmdb[:key]
    end

    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first(20).map do |movie_data|
      MovieData.new(movie_data)
    end
  end

  def self.search(query)
    response = conn.get("/3/search/movie") do |req|
      req.params[:api_key] = Rails.application.credentials.tmdb[:key]
      req.params[:query] = query
    end

    json = JSON.parse(response.body, symbolize_names: true)
    results = json[:results].first(20)

    sorted = results.sort_by { |movie| movie[:id] }

    sorted.map { |movie_data| MovieData.new(movie_data) }
  end

  private

  def self.conn
    Faraday.new(url: "https://api.themoviedb.org")
  end
end