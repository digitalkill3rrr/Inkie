class AddUserpicToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :userpic, :string
  end
end
