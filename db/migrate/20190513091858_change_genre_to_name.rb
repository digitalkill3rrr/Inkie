class ChangeGenreToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :genre, :title
  end
end
