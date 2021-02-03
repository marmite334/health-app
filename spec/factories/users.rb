FactoryBot.define do
  factory :user do
    id                    {Faker::Number.number(digits: 1)}
    nickname              {Faker::Internet.username(specifier: 6)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    birth_date            {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end