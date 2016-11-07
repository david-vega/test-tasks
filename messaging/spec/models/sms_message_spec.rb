require 'rails_helper'

RSpec.describe SmsMessage, type: :model do
  it { should belong_to(:account) }
  it { should validate_presence_of(:account) }

  it { should belong_to(:user) }

  subject{ FactoryGirl.create :sms_message }

  it{ expect(subject.thread_uuid).to_not be_nil }
end
