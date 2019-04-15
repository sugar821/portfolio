class Task < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_one_attached :image
    validates :title, presence: true
    validates :hours, presence: true
    # validate :start_end_check
    
    # def start_end_check
    #     errors.add(:finish_time, "がstart_timeよりも早い時間になっています")unless
    #     self.start_time <= finish_time
    # end
    
    def start_time
        self.created_at
    end
    # def self.csv_attributes
    #     %w(title start_time finish_time complete)
    # end
    
    # def self.generate_csv
    #     CSV.generate(headers: true) do |csv|
    #         csv << csv_attributes
    #         all.each do |task|
    #          csv << csv_attributes.map{|attr| task.send(attr)}
    #         end
    #     end
    # end
end
