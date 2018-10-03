class AddDefaultPictureToDestination < ActiveRecord::Migration[5.2]
  def change
    change_column :destinations, :picture_url, :string, default:"https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif"

  end
end
