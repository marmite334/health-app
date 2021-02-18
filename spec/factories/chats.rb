FactoryBot.define do
  factory :chat do
    text {Faker::String.random}
    created_at {Time.now}
    updated_at {Time.now}
    association :user
  end
end
