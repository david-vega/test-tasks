OnboardiqTestMessages.Views.SmsMessages ||= {}

class OnboardiqTestMessages.Views.SmsMessages.SmsMessageView extends Backbone.View
  template: JST["backbone/templates/sms_messages/sms_message"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    @.remove()

    false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    @
