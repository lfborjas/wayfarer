class Wayfarer.Routers.MapsRouter extends Backbone.Router
  initialize: (options) ->
    @maps = new Wayfarer.Collections.MapsCollection()
    @maps.reset options.maps

  routes:
    "/new"      : "newMap"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newMap: ->
    @view = new Wayfarer.Views.Maps.NewView(collection: @maps)
    $("#maps").html(@view.render().el)

  index: ->
    @view = new Wayfarer.Views.Maps.IndexView(maps: @maps)
    $("#maps").html(@view.render().el)

  show: (id) ->
    map = @maps.get(id)
    
    @view = new Wayfarer.Views.Maps.ShowView(model: map)
    $("#maps").html(@view.render().el)
    
  edit: (id) ->
    map = @maps.get(id)

    @view = new Wayfarer.Views.Maps.EditView(model: map)
    $("#maps").html(@view.render().el)
  