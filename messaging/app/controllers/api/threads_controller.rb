class Api::ThreadsController < Api::BaseController
  respond_to :json

  def index
    @threads = @account.sms_messages.sorted.includes([:user, :account]).all.group_by(&:thread_uuid).to_a

    respond_with @threads
  end

  def update
    SmsMessage.mark_thread_as_read!(thread_params)
    render json: { message: 'success' }, status: :ok
  end

  private

  def thread_params
    params.require(:sms_message).permit(:thread_uuid)
  end
end
