class AddGenreIdToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :genre_id, :integer
  end
end
