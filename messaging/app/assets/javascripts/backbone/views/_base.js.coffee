class OnboardiqTestMessages.Views.Base extends Backbone.View

  render: ->
    @$el.html @template @model.toJSON()
    @