FactoryBot.define do
  factory :comment do
    content {Faker::String.random}
    association :user
    association :post
  end
end
