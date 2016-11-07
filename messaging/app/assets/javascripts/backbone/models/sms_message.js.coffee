class OnboardiqTestMessages.Models.SmsMessage extends Backbone.Model
  paramRoot: 'sms_message'

class OnboardiqTestMessages.Collections.SmsMessagesCollection extends Backbone.Collection
  model: OnboardiqTestMessages.Models.SmsMessage
  url: '/sms_messages'

  toJSON: ->
    _.extend {}, date: this.models[0].attributes.created_at
