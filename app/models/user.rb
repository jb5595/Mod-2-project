class User < ApplicationRecord
  ##################Associations##########################
  has_many :itineraries
  has_many :destinations, through: :itineraries
  # Creates Wishlist
  has_many :wishlist_itineraries
  has_many :wishlist, through: :wishlist_itineraries, :source => "itinerary"

  # Creates following assocation
  has_many :active_relationships, class_name:  "Relationship",
                                 foreign_key: "follower_id",
                                 dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  ##################Validations##########################
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password



  ##################CallBacks##########################
  # before_save :capitalize_name

  ##################Methods##########################
  def capitalize_name
    self.first_name = self.first_name.capitalize
    self.last_name = self.last_name.capitalize
  end
  #follows users
 def follow(other_user)
    self.following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    self.following.delete(other_user)
  end

  # Returns true if the current user is following the other user.

  def following?(other_user)
    self.following.include?(other_user)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def feed
    self.following.collect do |user|
      user.itineraries.collect do |itinerary|
        itinerary
      end
    end.flatten
  end

  def feed_ordered_by_most_recent
    self.feed.sort_by do |itinerary|
      itinerary.created_at
    end
  end

  def feed_ordered_by_budget
    self.feed.sort_by do |itinerary|
      itinerary.budget
    end
  end

  def feed_ordered_by_user
    self.feed.sort_by do |itinerary|
      itinerary.user.user_name
    end
  end

  def feed_filtered_by_destination(destination_name)
    destination_name = destination_name.split.map(&:capitalize).join(' ')
    self.feed.select do |itinerary|
       itinerary.destinations.any?{|destination| destination.name == destination_name}
    end
  end

end
