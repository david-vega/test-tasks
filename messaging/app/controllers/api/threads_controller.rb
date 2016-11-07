class Api::ThreadsController < Api::BaseController
  respond_to :json

  def index
    @threads = @account.sms_messages.sorted.includes([:user, :account]).all.group_by(&:thread_uuid).to_a

    respond_with @threads
  end
end
