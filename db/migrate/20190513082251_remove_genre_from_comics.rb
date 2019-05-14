class RemoveGenreFromComics < ActiveRecord::Migration[5.2]
  def change
    remove_column :comics, :genre, :string
  end
end
