class Destination < ApplicationRecord
  has_many :stops
  has_many :itineraries, through: :stops
  has_many :users, through: :itineraries
end
