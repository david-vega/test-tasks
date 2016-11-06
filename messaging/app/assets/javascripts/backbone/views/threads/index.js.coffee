OnboardiqTestMessages.Views.Threads ||= {}

class OnboardiqTestMessages.Views.Threads.IndexView extends OnboardiqTestMessages.Views.Base
  template: JST["backbone/templates/threads/index"]

  el: '#messages'

  initialize: () ->
    @collection.bind('reset', @render)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (thread) =>
    view = new OnboardiqTestMessages.Views.Threads.ThreadView({model : thread})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(smsMessages: @collection.toJSON() ))
    @addAll()

    @
