require 'rails_helper'
#typeをcontroller -> request に変更
#参考: https://stackoverflow.com/questions/29853056/rspec-undefined-method-request
RSpec.describe Task do
    it "has valid factory task" do
        expect(FactoryBot.build(:task)).to be_valid
    end
    
    it "has valid factory category" do
        expect(FactoryBot.build(:category)).to be_valid
    end
end