class OnboardiqTestMessages.Models.SmsMessage extends Backbone.Model
  paramRoot: 'sms_message'

  defaults:
    from_number: null
    to_number: null

class OnboardiqTestMessages.Collections.SmsMessagesCollection extends Backbone.Collection
  model: OnboardiqTestMessages.Models.SmsMessage
  url: '/sms_messages'
