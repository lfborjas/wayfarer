Wayfarer.Views.Maps ||= {}

class Wayfarer.Views.Maps.NewView extends Backbone.View    
  template: JST["backbone/templates/maps/new"]
  
  events:
    "submit #new-map": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (map) =>
        @model = map
        window.location.hash = "/#{@model.id}"
        
      error: (map, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this