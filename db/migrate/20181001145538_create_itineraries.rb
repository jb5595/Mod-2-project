class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.integer :user_id
      t.string :duration
      t.integer :likes
      t.string :budget_category
      t.string :name


      t.timestamps
    end
  end
end
