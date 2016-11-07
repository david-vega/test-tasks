class SmsMessage < ActiveRecord::Base
  BATCH_SIZE = 30
  belongs_to :account
  validates :account, presence: true

  belongs_to :user

  before_create :set_thread_uuid

  scope :unread, -> { where(unread: true) }
  scope :outbound, -> { where(outbound: true) }
  scope :sorted, -> { order(created_at: :desc) }
  scope :thread_by_numbers, -> (*numbers){ where(from_number: numbers, to_number: numbers) }
  scope :thread, -> (thread_uuid){ where(thread_uuid: thread_uuid) }

  def self.mark_thread_as_read!(thread_uuid:)
    SmsMessage.thread(thread_uuid).unread.find_in_batches(batch_size: BATCH_SIZE) do |sms_messages|
      SmsMessage.transaction do
        sms_messages.each{ |sms_message| sms_message.update_attribute(:unread, false) }
      end
    end
  end

  private

  def set_thread_uuid
    self.thread_uuid = SmsMessage.thread_by_numbers(from_number, to_number).last.try(:thread_uuid) ||
                       SecureRandom.uuid
  end
end
