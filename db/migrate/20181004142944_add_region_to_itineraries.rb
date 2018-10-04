class AddRegionToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :region, :string
  end
end
