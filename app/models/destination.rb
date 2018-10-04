class Destination < ApplicationRecord
  ##################Mounting Uploader##########################
  # mount_uploader :picture_url, DestinationPicUploader

  ##################Associations##########################
  has_many :stops
  has_many :itineraries, through: :stops
  has_many :users, through: :itineraries

  ##################CallBacks##########################
  before_save :capitalize_name

  ##################Validation##########################
  validates :name, presence: true
  validates :region, presence: true
  validates :description, presence: true

  @@regions = ["North America", "South America", "Europe", "Asia", "Africa", "Oceania"]

  def self.regions
    @@regions
  end

  def self.destinations_which_match_itinerary_region(itinerary)
    self.all.select do |destination|
      byebug
      destination.region == itinerary.region
    end
  end

  private
  #ensures uniform format for destination names to aid search queries
  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end

end
