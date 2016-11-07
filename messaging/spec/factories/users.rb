FactoryGirl.define do
  factory :user do
    sequence(:name){ |n| "Account#{n}" }
    sequence(:email){ |n| "email#{n}@example.com" }
    association :account
  end
end
