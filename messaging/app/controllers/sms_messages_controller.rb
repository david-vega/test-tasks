class SmsMessagesController < ApplicationController
  def index
    @threads = @account.sms_messages.sorted.includes([:user, :account])#.all.group_by{ |sms| [sms.to_number, sms.from_number] }
  end
end
