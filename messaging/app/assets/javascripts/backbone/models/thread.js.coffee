class OnboardiqTestMessages.Models.Thread extends Backbone.Model
  paramRoot: 'thread'

  uuid: ->
    @attributes[0]

  smsCollection: ->
    @smsMessages = new OnboardiqTestMessages.Collections.SmsMessagesCollection(@attributes[1])

  toJSON: ->
    _.extend {}, uuid: @uuid(),
                 from_number: @attributes[1][0].from_number,
                 to_number: @attributes[1][0].to_number,
                 body: @attributes[1][0].body

class OnboardiqTestMessages.Collections.ThreadsCollection extends Backbone.Collection
  model: OnboardiqTestMessages.Models.Thread
  url: '/api/threads'
