#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.OnboardiqTestMessages =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  startApplication: (params) ->
    window.router = new OnboardiqTestMessages.Routers.SmsMessagesRouter(params)
    Backbone.history.start pushState: true