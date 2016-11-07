require 'rails_helper'

RSpec.describe SmsMessage, type: :model do
  it { should belong_to(:account) }
  it { should validate_presence_of(:account) }

  it { should belong_to(:user) }

  subject{ FactoryGirl.create :sms_message }

  it{ expect(subject.thread_uuid).to_not be_nil }

  describe '#mark_thread_as_read!' do
    before do
      (0..400).each do
        subject.account.sms_messages.create(
          outbound: true,
          from_number: subject.from_number,
          to_number: subject.to_number,
          body: 'text content'
        )
      end
    end

    it{ expect(SmsMessage.mark_thread_as_read!(thread_uuid: subject.thread_uuid)).to be_nil }
  end
end
