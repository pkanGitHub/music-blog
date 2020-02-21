class Song < ApplicationRecord
    has_many :song_reviews
    has_many :songs, through: :song_reviews

    accepts_nested_attributes_for :song_reviews
end
