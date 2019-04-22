FactoryBot.define do
  factory :user do
    username "abc"
    sequence(:email) { |n| "test#{n}@example.com" }
    password "foobar"
    confirmed_at Time.now
  end
end