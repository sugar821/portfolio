class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_one_attached :image
    validates :title, presence: true
    validates :minutes, presence: true
    validate :minutes_check
    
    def minutes_check
        errors.add(:minutes, "が30分単位になっていません")unless
        self.minutes.to_i % 30 == 0
    end
    
    def start_time
        self.updated_day
    end
end
