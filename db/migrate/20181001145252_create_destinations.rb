class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :picture_url
      t.string :description
      t.string :name
      t.string :region

      t.timestamps
    end
  end
end
