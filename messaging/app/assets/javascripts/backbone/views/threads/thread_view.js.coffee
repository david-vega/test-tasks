OnboardiqTestMessages.Views.Threads ||= {}

class OnboardiqTestMessages.Views.Threads.ThreadView extends OnboardiqTestMessages.Views.Base
  template: JST['backbone/templates/threads/thread']

  render: ->
    super
    @smsView = new OnboardiqTestMessages.Views.SmsMessages.IndexView
                                         collection: @model.smsCollection()
                                         el: @$('.conversation')
    @smsView.render().el
    @
