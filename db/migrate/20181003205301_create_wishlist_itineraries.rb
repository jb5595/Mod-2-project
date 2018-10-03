class CreateWishlistItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlist_itineraries do |t|
      t.integer :user_id
      t.integer :itinerary_id

    end
  end
end
