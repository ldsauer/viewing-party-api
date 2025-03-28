FactoryBot.define do
  factory :movie do
    tmdb_id { Faker::Number.unique.number(digits: 4) }
    title { Faker::Movie.title }
    vote_average { rand(1.0..10.0).round(3) }
  end
end