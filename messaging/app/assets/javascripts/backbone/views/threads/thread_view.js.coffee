OnboardiqTestMessages.Views.Threads ||= {}

class OnboardiqTestMessages.Views.Threads.ThreadView extends OnboardiqTestMessages.Views.Base
  template: JST['backbone/templates/threads/thread']

  events:
    'click .show_conversation': 'update'

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    $.ajax
      url: "#{@model.collection.url}/#{@model.uuid()}"
      type: 'PUT'

  render: ->
    super
    @smsView = new OnboardiqTestMessages.Views.SmsMessages.IndexView
                                         collection: @model.smsCollection()
                                         el: @$('.conversation')
    @smsView.render().el
    @
