class OnboardiqTestMessages.Routers.SmsMessagesRouter extends Backbone.Router
  initialize: (options) ->
    @smsMessages = new OnboardiqTestMessages.Collections.SmsMessagesCollection()
    @smsMessages.reset options.smsMessages

  routes:
    'sms_messages(/)' : 'index'

  index: ->
    @view = new OnboardiqTestMessages.Views.SmsMessages.IndexView(collection: @smsMessages)
    $("#sms_messages").html(@view.render().el)


