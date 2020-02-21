class CreateSongReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :song_reviews do |t|
      t.integer :user_id
      t.integer :song_id
      t.string :review

      t.timestamps
    end
  end
end
