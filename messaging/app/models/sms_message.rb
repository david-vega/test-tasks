class SmsMessage < ActiveRecord::Base
  belongs_to :account
  validates :account, presence: true

  belongs_to :user

  before_create :set_thread_uuid

  scope :unread, -> { where(unread: true) }
  scope :outbound, -> { where(outbound: true) }
  scope :sorted, -> { order(created_at: :desc) }
  scope :thread, -> (*numbers){ where(from_number: numbers, to_number: numbers) }

  private

  def set_thread_uuid
    self.thread_uuid = SmsMessage.thread(from_number, to_number).last.try(:thread_uuid) || SecureRandom.uuid
  end
end
