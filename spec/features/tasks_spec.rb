# require 'rails_helper'

# RSpec.feature "Tasks", type: :feature do
#   scenario "user create new tasks" do
#     @user = FactoryBot.create(:user)
#     visit root_path
    
#     click_link "ログイン"
#     fill_in "メールアドレス", with: @user.email
#     fill_in "パスワード" , with: @user.password
#     click_button "Log in"
    
#     expect(page).to have_content "New Task"
#     expect(page).to have_content "SUMMARY"
#     expect(page).to have_content "SEARCH"
#     expect(page).to have_content "ログアウト"
#     expect(page).to have_content "welcome #{@user.nick_name}"
#   end
# end
