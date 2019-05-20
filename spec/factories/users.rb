FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "000000" }
    admin { true }
  end
end