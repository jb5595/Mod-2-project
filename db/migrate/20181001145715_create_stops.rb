class CreateStops < ActiveRecord::Migration[5.2]
  def change
    create_table :stops do |t|
      t.string :image_url
      t.string :duration
      t.integer :itinerary_id
      t.integer :destination_id
      t.string :description

      t.timestamps
    end
  end
end
