class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :adress
      t.integer :comic_id

      t.timestamps
    end
  end
end
