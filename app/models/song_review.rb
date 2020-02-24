class SongReview < ApplicationRecord
    belongs_to :user
    belongs_to :song

    validates :review, length: { maximum: 500 }
    validates_uniqueness_of :song, scope: :user, message: ": You've already written a review for this song."
end
