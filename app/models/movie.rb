class Movie < ApplicationRecord
  has_many :viewing_parties

  validates :tmdb_id, presence: true, uniqueness:true
  validates :title
  validates :vote_average
end