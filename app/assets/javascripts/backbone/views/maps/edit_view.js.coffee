Wayfarer.Views.Maps ||= {}

class Wayfarer.Views.Maps.EditView extends Backbone.View
  template : JST["backbone/templates/maps/edit"]
  
  events :
    "submit #edit-map" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (map) =>
        @model = map
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this