class SongReview < ApplicationRecord
    belongs_to :user
    belongs_to :song

    validates :review, presence: true, length: { maximum: 500 }
    validates_uniqueness_of :song, scope: :user
    
    def self.search_for_user_review(user)
        where(user: user).limit(1).first
    end
end
