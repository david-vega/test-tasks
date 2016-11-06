class OnboardiqTestMessages.Routers.MessagesRouter extends Backbone.Router
  initialize: ->
    @threads = new OnboardiqTestMessages.Collections.ThreadsCollection()

  routes:
    'messages(/)' : 'index'

  index: ->
    @view = new OnboardiqTestMessages.Views.Threads.IndexView(collection: @threads)
    @threads.fetch reset: true
