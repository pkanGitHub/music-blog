class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :artist_name
      t.string :title
      t.string :genre
      t.string :language
      t.string :link

      t.timestamps
    end
  end
end
