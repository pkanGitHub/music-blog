class Song < ApplicationRecord
    has_many :song_reviews
    has_many :songs, through: :song_reviews

    accepts_nested_attributes_for :song_reviews

    validates_uniqueness_of :title, scope: :artist_name
    # you can't have a same song title from the same artist
    validates :artist_name, presence: true
    validates :genre, presence: true
    validates :language, presence: true
    validates :genre, presence: true
    # validates_format_of :link, :with =>  allow_blank: true

end
