class OnboardiqTestMessages.Models.Thread extends Backbone.Model
  paramRoot: 'thread'

  toJSON: ->
    _.extend {}, uuid: @attributes[0],
                 from_number: @attributes[1][0].from_number,
                 to_number: @attributes[1][0].to_number,
                 body: @attributes[1][0].body

class OnboardiqTestMessages.Collections.ThreadsCollection extends Backbone.Collection
  model: OnboardiqTestMessages.Models.Thread
  url: '/api/threads'
