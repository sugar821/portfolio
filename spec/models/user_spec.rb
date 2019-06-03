require 'rails_helper'

RSpec.describe User, type: :model do
    it "is valid with a nick name, email, and password" do 
        user = FactoryBot.build(:user)
        expect(user).to be_valid
    end
    
    #emailがなければ無効である
    it "is invalid without email" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
    end
    
    #nicknameがなければ無効である
    it "is invalid without nickname" do
        user = FactoryBot.build(:user, nick_name: nil)
        user.valid?
        expect(user.errors[:nick_name]).to include("を入力してください")
    end
    
    #passwordがなければ無効である
    it "is invalid without password" do
    user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
    end
    
    #nick_nameが重複しているなら無効である
    it "is invalid not unique nick_name" do
        FactoryBot.create(:user, nick_name: "test")
        user = FactoryBot.build(:user, nick_name: "test")
        user.valid?
        expect(user.errors[:nick_name]).to include("はすでに存在します")
    end
    
    #emailが重複しているなら無効である
    it "is invalid not unique email" do
        FactoryBot.create(:user, email: "test@example.com")
        user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
    end
end

describe User do
    it "has valid factory" do
        expect(FactoryBot.build(:user)).to be_valid
    end
    
    it "has many tasks" do
        user = FactoryBot.create(:user, :create_tasks)
        expect(user.tasks.length).to eq 6
    end
end