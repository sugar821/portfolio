FactoryBot.define do
  factory :review do
    title { "MyText" }
    good { false }
    task { nil }
    user { nil }
  end
end
