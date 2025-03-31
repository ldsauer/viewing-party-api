class Api::V1::MoviesController < ApplicationController
  def index
    if params[:query].present? 
      movies = MovieGateway.search(params[:query])
    else
      movies = MovieGateway.top_rated
    end

    render json: MovieSerializer.new(movies)
  end
end