class OnboardiqTestMessages.Models.Thread extends Backbone.Model
  paramRoot: 'thread'

class OnboardiqTestMessages.Collections.ThreadsCollection extends Backbone.Collection
  model: OnboardiqTestMessages.Models.Thread
  url: '/api/threads'
