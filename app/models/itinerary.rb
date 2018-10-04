class Itinerary < ApplicationRecord
  mount_uploader :picture_url, ItineraryPicUploader
  ##################Associations##########################
  belongs_to :user
  has_many :stops
  has_many :wishlist_itineraries
  has_many :destinations, through: :stops
  has_many :wishlist_users, through: :wishlist_itineraries, :source => 'itinerary'


  accepts_nested_attributes_for :destinations

  ##################Associations##########################
  validates :name, presence: :true
  validates :duration, presence: :true
  validates :budget_category, presence: :true



  @@budget_categories = ["< $30/Day","$30-75/Day","$75-150/Day", "> $150/Day"]

  @@regions = ["North America", "South America", "Europe", "Asia", "Africa", "Oceania"]

  def self.regions
    @@regions
  end

  def shortened_name
    if self.name.length <= 10
      self.name
    else
      "#{self.name[0..9]}..."
    end
  end

  def self.budget_categories
    @@budget_categories
  end
# Custom Setter for Budget For Sorting Purposes
  def budget
    if @budget
       @budget
     else
       if self.budget_category == "< $30/Day"
         @budget = 1
       elsif self.budget_category == "$30-75/Day"
         @budget = 2
       elsif self.budget_category == "$75-150/Day"
         @budget = 3
       elsif self.budget_category == "> $150/Day"
         @budget = 4
       end
     end
  end



  def destination_attributes=(destination_attributes)
    destination_attributes.values.each do |destination_attribute|
      destination = Destination.find_or_create_by(destination_attribute)
      self.destinations << destination
    end
  end


  def author
    self.user.user_name
  end

  def self.most_recent
    self.all.sort_by do |itinerary|
      itinerary.created_at
    end
  end

  def self.sort_by_user
    self.all.sort_by do |itinerary|
      itinerary.user.user_name
    end
  end

  def self.sort_by_budget
    self.all.sort_by do |itinerary|
      itinerary.budget
    end
  end

  def self.filter_by_destination(destination_name)

    # Captilizes first letter of each word in search query to ensure it matches DB format
    destination_name = destination_name.split.map(&:capitalize).join(' ')
    self.all.select do |itinerary|
       itinerary.destinations.any?{|destination| destination.name == destination_name}
    end
  end




end
