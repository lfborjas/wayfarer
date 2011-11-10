Wayfarer.Views.Maps ||= {}

class Wayfarer.Views.Maps.MapView extends Backbone.View
    initialize: ->
        center = this.options.center
        control_position = {position: google.maps.ControlPosition.TOP_RIGHT}
        styles = [
            {
                featureType: "road.arterial"
                stylers: [{hue: "#cab286"}, {saturation: -61}, {lightness: -14}]
            }
            {
                featureType: "road.highway"
                stylers: [{hue: "#a38757"}, {saturation: -29}, {lightness: -37}]
            }
            {
                featureType: "poi.park"
                stylers: [{hue: "#a5b779"}, {saturation: -30}, {lightness: -24}]
            }
        ]
        @map = new google.maps.Map((unless @el instanceof jQuery then $(@el) else @el)[0],
            zoom : 15
            center: new google.maps.LatLng(center.coords.latitude, center.coords.longitude)
            mapTypeId: google.maps.MapTypeId.ROADMAP
            panControlOptions: control_position
            rotateControlOptions: control_position
            zoomControlOptions: control_position
            streetViewControlOptions: control_position
            styles: styles
        )
        this.add_controls this.options.controls
        @bounds = new google.maps.LatLngBounds()
    add_controls : (controls)->
        for position, control of controls
            @map.controls[google.maps.ControlPosition[position]].push control[0]
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
          position : new google.maps.LatLng(model.lat, model.lng)
          map: @map
        )
        marker.setVisible visible
        @bounds.extend marker.position
        marker
    fit_bounds : () ->
        if @bounds?
            @map.fitBounds @bounds
