class Task < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :start_time, presence: true
    validates :finish_time, presence: true
    validate :start_end_check
    
    def start_end_check
        errors.add(:finish_time, "がstart_timeよりも早い時間になっています")unless
        self.start_time <= finish_time
    end
end
