require 'rails_helper'

RSpec.describe TasksController, type: :controller do
 describe "show" do
     
   before do
      @user = create(:user)
      sign_in @user
   end
   
   it "タスクを作成する" do
      FactoryBot.create(:task)        
      expect(response).to be_successful
   end
   
   it "正常にレスポンスを返すこと" do
       get :new
       expect(response).to be_successful
   end

   it "レスポンスコードが200であること" do
      get :new
     expect(response).to have_http_status "200"
   end
 end

end
