require "rails_helper"

RSpec.describe "Movies API", type: :request do
  describe "GET /api/v1/movies" do 
    it "returns a list of movies" do 
      fake_movies = [
        MovieData.new({ id: 1, title: "Shrek", vote_average: 8.5 }),
        MovieData.new({ id: 2, title: "The Matrix", vote_average: 9.0 }), 
        MovieData.new({ id: 3, title: "V for Vendetta", vote_average: 9.9 })
      ]
      
      allow(Moviegateway). to recieve(:top_rated).and_return(fake_movies)
      
      get '/api/v1/movies'

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to be_an(Array)
      expect(json[:data].count).to eq(3)

      json[:data].each do |movie|
        expect(movie).to have_key(:id)
        expect(movie[:id]).to be_a(String)

        expect(movie).to have_key(:type)
        expect(movie[:type]).to eq("movie")

        expect(movie).to have_key(:attributes)
        expect(movie[:attributes]).to be_a(Hash)

        expect(movie[:attributes]).to have_key(:title)
        expect(movie[:attributes][:title]).to be_a(String)

        expect(movie[:attributes]).to have_key(:vote_average)
        expect(movie[:attributes][:vote_average]).to be_a(Float)
      end
    end
  end
end