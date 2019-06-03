require 'rails_helper'

RSpec.describe TasksController, type: :controller do
#最も基本的なコントローラのテスト、TOPページが正常に帰ってくるか
#コントローラのテストだけしたい時のコマンド → rspec spec/controllers
    describe "#top" do
        it "responds successfully" do
            get :top
            expect(response).to be_success
        end
        
        it "return 200" do
            get :top
            expect(response).to have_http_status "200"
        end
    end
    
    #ログインユーザが正常にページアクセスできる事
    describe "#summary" do
        context "as authenticate_user" do
            before do
                @user = FactoryBot.create(:user)
            end
            
            it "add task" do
                @category = FactoryBot.create(:category)
                sign_in @user
                task_params = {title:"test", minutes:60, complete:false, user_id: @user, category_id: @category}
                expect{
                    post :create, params: {task: task_params}
                }.to change(Task, :count).by(1)
            end
            
            it "cant add invalid task" do
                @category = FactoryBot.create(:category)
                sign_in @user
                task_params = {title:nil, minutes:60, complete:false, user_id: @user, category_id: @category}
                expect{
                    post :create, params: {task: task_params}
                }.to_not change(Task, :count)
            end
            
            it "responds successfully to summary" do
                sign_in @user
                get :summary
                expect(response).to have_http_status "200"
            end
            
            it "responds successfully to new" do
                sign_in @user
                get :new
                expect(response).to have_http_status "200"
            end
        end
        
    #未ログインユーザはログインが必要なページにアクセスできず、リダイレクトされる事
        context "as not_authenticate_user" do
            it "cant access summary" do
                get :summary
                expect(response).to have_http_status "302"
            end
            
            it "redirect_to sign_in" do
                get :summary
                expect(response).to redirect_to "/users/sign_in"
            end
        end
    end
    
    #showにアクセス可能な事
    describe "show" do
        context "as authenticate_user" do
            before do
                @user = FactoryBot.create(:user)
                @user2 = FactoryBot.create(:user)
                @task = FactoryBot.create(:task, user: @user)
            end
            
            it "responds successfully" do
                sign_in @user
                get :show, params:{id: @task.id}
                expect(response).to be_success
            end
            
            #未ログインユーザはアクセス不可
            it "cant access othe user's task" do
                sign_in @user2
                get :show, params:{id: @task.id}
                expect(response).to have_http_status "302"
            end
        end
    end
    
  #自身のTASKを操作可能な事
    describe "update/destroy" do
        #task ownerはアップデート可能
        context "as authenticate_user" do
            before do
                @user = FactoryBot.create(:user)
                @task = FactoryBot.create(:task, user: @user)
            end
            
            it "can update tasks" do
                sign_in @user
                task_params = FactoryBot.attributes_for(:task, title: "change title")
                patch :update, params: {id: @task.id, task: task_params}
                expect(@task.reload.title).to eq "change title"
            end
            
            it "can Delete own tasks" do
                sign_in @user
                expect{
                    delete :destroy, params: {id: @task.id}
                }.to change(Task, :count)
            end
        end
        
        #他人のTASKを操作できない事
        context "as not task owner" do
            before do
                @user = FactoryBot.create(:user)
                @other_user = FactoryBot.create(:user)
                @task = FactoryBot.create(:task, user: @user)
            end
            
            it "cant update others tasks" do
                sign_in @other_user
                task_params = FactoryBot.attributes_for(:task, title: "change title")
                patch :update, params: {id: @task.id, task: task_params}
                expect(@task.reload.title).to eq "MyTitle"
            end
            
            it "cant update and redirect to tasks" do
                sign_in @other_user
                task_params = FactoryBot.attributes_for(:task, title: "change title")
                patch :update, params: {id: @task.id, task: task_params}
                expect(response).to redirect_to "/tasks"
            end
            
            it "cant Delete others tasks" do
                sign_in @other_user
                expect{
                    delete :destroy, params: {id: @task.id}
                }.to_not change(Task, :count)
            end
        end
    end
end