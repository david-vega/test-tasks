OnboardiqTestMessages.Views.SmsMessages ||= {}

class OnboardiqTestMessages.Views.SmsMessages.IndexView extends OnboardiqTestMessages.Views.Base
  template: JST['backbone/templates/sms_messages/index']

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (smsMessage) =>
    view = new OnboardiqTestMessages.Views.SmsMessages.SmsMessageView({model : smsMessage})
    @$('div').append(view.render().el)

  render: =>
    @$el.html(@template(smsMessages: @collection.toJSON() ))
    @addAll()

    @
