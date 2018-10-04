class Stop < ApplicationRecord

  belongs_to :itinerary
  belongs_to :destination

  accepts_nested_attributes_for :destination


end
