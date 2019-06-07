require 'rails_helper'
RSpec.describe Task, type: :model  do
    it "is valid with title minutes complete category user " do
        task = FactoryBot.build(:task)
        expect(task).to be_valid
    end
    
    it "can upload image" do
        task = FactoryBot.build(:task).image
        expect(task).to be_an_instance_of(ActiveStorage::Attached::One)
    end
    
    it "is invalid with no title" do
        task = FactoryBot.build(:task, title:nil)
        task.valid?
        expect(task.errors[:title]).to include("を入力してください")
    end
    
    it "is invalid with no minutes" do
        task = FactoryBot.build(:task, minutes:nil)
        task.valid?
        expect(task.errors[:minutes]).to include("を入力してください")
    end

    it "is invalid with no category" do
        task = FactoryBot.build(:task, category:nil)
        task.valid?
        expect(task.errors[:category]).to include("を入力してください")
    end
    
    it "is invalid with no user " do
        task = FactoryBot.build(:task, user:nil)
        task.valid?
        expect(task.errors[:user]).to include("を入力してください")
    end
end