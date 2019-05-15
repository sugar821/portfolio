FactoryBot.define do
  factory :task do
    title { "MyString" }
    start_time { "2019-04-03 05:50:52" }
    finish_time { "2019-04-03 05:50:52" }
    complete { false }
    user_id {1}
    category_id {1}
  end
end
