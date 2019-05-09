FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "abc#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password "foobar"
    confirmed_at Time.now
  end
end
