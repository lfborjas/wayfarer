Wayfarer.Views.Maps ||= {}

class Wayfarer.Views.Maps.IndexView extends Backbone.View
  template: JST["backbone/templates/maps/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.maps.bind('reset', @addAll)
   
  addAll: () ->
    @options.maps.each(@addOne)
  
  addOne: (map) ->
    view = new Wayfarer.Views.Maps.MapView({model : map})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(maps: @options.maps.toJSON() ))
    @addAll()
    
    return this