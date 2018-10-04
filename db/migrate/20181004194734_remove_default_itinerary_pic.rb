class RemoveDefaultItineraryPic < ActiveRecord::Migration[5.2]
  def change
    change_column :itineraries, :picture_url, :string

  end
end
