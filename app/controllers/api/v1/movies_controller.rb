class Api::V1::MoviesController < ApplicationController
  def index
    movies = MovieGateway.top_rated
    render json: MovieSerializer.new(movies)
  end
end