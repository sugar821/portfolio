class Review < ApplicationRecord
  belongs_to :task, counter_cache: :likes_count
  belongs_to :user
  
  validates :comment, presence: true
end
