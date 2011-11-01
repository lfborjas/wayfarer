Wayfarer.Views.Maps ||= {}

class Wayfarer.Views.Maps.MapView extends Backbone.View
    initialize: ->
        center = this.options.center
        @map = new google.maps.Map((unless @el instanceof jQuery then $(@el) else @el)[0],
            zoom : 15
            center: new google.maps.LatLng(center.coords.latitude, center.coords.longitude)
            mapTypeId: google.maps.MapTypeId.ROADMAP
        )
    add_controls : (controls)->
        for position, control of controls
            @map.controls[google.maps.ControlPosition[position]].push control
    set_center : (point, add_marker = false) ->
        _center = unless point instanceof google.maps.LatLng
                    new google.maps.LatLng(point.latitude, point.longitude)
                  else
                    point
        @map.setCenter _center

        if add_marker
            @add_marker(point)
    add_marker : (model, visible = true) ->
        model = model.attributes if model.attributes?
        marker = new google.maps.Marker(
          position : new google.maps.LatLng(model.latitude, model.longitude)
          map: @map
        )
        marker.setVisible visible
        @bounds.extend marker.position
        marker
