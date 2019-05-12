class RemoveUserIdFromComics < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :user_id, :integer
  end
end
