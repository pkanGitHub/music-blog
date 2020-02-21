class Song < ApplicationRecord
    has_many :song_reviews
    has_many :songs, through: :song_reviews

    accepts_nested_attributes_for :song_reviews

    validates_uniqueness_of :title, scope: :user_id
    # you can't have a same song title from the same artist
    validates :artist_name, presence: true
    validates :genre, presence: true
    validates :language, presence: true
    validates :genre, presence: true
    validates :link, allow_blank: true

    # example: has_many :line_items, inverse_of: :order
    # do i need inverse_of for assoiciation?
end
