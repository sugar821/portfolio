require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Task. As you add validations to Task, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TasksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Task.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      task = Task.create! valid_attributes
      get :show, params: {id: task.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      ## TODO
      ## サインイン処理を入れる。
      ## 参考：https://qiita.com/Kohei_Kishimoto0214/items/e29e509b12a6eb484a42
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      task = Task.create! valid_attributes
      get :edit, params: {id: task.to_param}, session: valid_session

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
