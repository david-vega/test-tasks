FactoryGirl.define do
  factory :sms_message do
    association :account
    association :user
  end
end
