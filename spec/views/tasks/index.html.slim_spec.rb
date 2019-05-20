require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:query, [
      Task.create!(
        :title => "Title",
        :category => Category.first,
        :user => User.first,
        :complete => false
      ),
      Task.create!(
        :title => "Title",
        :category => Category.first,
        :user => User.first,
        :complete => false
      )
    ])
    assign(:calendar_tasks,[
      Task.create!(
        :title => "Title",
        :category => Category.first,
        :user => User.first,
        :complete => false
      ),
      Task.create!(
        :title => "Title",
        :category => Category.first,
        :user => User.first,
        :complete => false
      )])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => Category.first.name.to_s, :count => 2
  end
end
