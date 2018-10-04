class Stop < ApplicationRecord
  belongs_to :itinerary
  belongs_to :destination

  mount_uploader :image_url, ImageUrlUploader




end
