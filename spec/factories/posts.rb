FactoryBot.define do
  factory :post do
    id                    {Faker::Number.number(digits: 1)}
    title                 {Faker::String.random}
    content               {Faker::String.random}
    category_id           {Faker::Number.within(range: 2..11)}
    association :user
  end
end