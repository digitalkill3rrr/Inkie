class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :cover
      t.integer :user_id
      t.string :genre

      t.timestamps
    end
  end
end
