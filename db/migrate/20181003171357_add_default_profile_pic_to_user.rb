class AddDefaultProfilePicToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :profile_pic, :string, default: "https://cdn.tutsplus.com/net/uploads/legacy/958_placeholders/placehold.gif"

  end
end
