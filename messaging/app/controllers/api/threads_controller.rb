class Api::ThreadsController < Api::BaseController
  respond_to :json

  def index
    @threads = @account.sms_messages.sorted.includes([:user, :account]).all.group_by{ |sms| [sms.to_number, sms.from_number] }

    respond_with @threads.values
  end
end