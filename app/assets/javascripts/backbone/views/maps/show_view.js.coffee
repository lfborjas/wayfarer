Wayfarer.Views.Maps ||= {}

class Wayfarer.Views.Maps.ShowView extends Backbone.View
  template: JST["backbone/templates/maps/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this