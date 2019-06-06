class AddCoverToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :cover, :string
  end
end
