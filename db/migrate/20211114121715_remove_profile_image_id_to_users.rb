class RemoveProfileImageIdToUsers < ActiveRecord::Migration[5.2]
  def down
    remove_column :users, :profile_image_id, :string
  end
end
