FactoryBot.define do
  factory :task do
    title "MyTitle"
    complete false
    minutes 60
    association :user
    association :category
  end
  
  #無効なタスク
  trait :invalid do
    title nil
  end
end
