FactoryBot.define do
  factory :user do
    sequence(:nick_name)  {|n| "testuser#{n}" }
    sequence(:email)  {|n| "test#{n}@example.com" }
    password  {"000000"}
    password_confirmation  {"000000"} 
    admin  {false}
  end
#通常のuserを継承し、admin属性のみ変更
#  factory :admin_user do
#    admin  true 
#  end

#taitを使う場合、複雑なテストケースを書きやすい？
  trait :admin_user do
    admin {true}
  end
#65Pあたり
  trait :create_tasks do
    after(:create) {|user| create_list(:task, 6, user: user)}
  end
end
