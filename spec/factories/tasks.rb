FactoryBot.define do
  factory :task do
    title { "MyString" }
    complete { false }
    user
    category
  end
end