class AddUserIdToSong < ActiveRecord::Migration[6.0]
  def change
    # this is a simple way to add a foreign key attribute 
    # We want to know which user created the song, 
    # so that we can give that user express permissions for editing or deliting a song.
    add_reference :songs, :user, foreign_key: true
  end
end
