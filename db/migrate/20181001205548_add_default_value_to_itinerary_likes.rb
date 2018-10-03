class AddDefaultValueToItineraryLikes < ActiveRecord::Migration[5.2]
  def change
    change_column :itineraries, :likes, :integer, default:0
  end
end
