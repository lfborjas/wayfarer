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
    add_marker : (model, visible = true, icon = null) ->
        icon = if icon instanceof String
            new google.maps.MarkerImage(icon, null, null, null, new google.maps.Size(40,40))
        else
            icon
        model = model.attributes if model.attributes?
        marker = new google.maps.Marker(
          position : new google.maps.LatLng(model.lat, model.lng)
          map: @map
          icon: icon
        )
        marker.setVisible visible
        @bounds.extend marker.position
        marker
    fit_bounds : () ->
        if @bounds?
            @map.fitBounds @bounds
        if @map.getZoom() > 13
            @map.setZoom 13
    random_point: (bounds) ->
        bounds ||= @map.getBounds()
        sw = bounds.getSouthWest()
        ne = bounds.getNorthEast()
        lngSpan   = ne.lng() - sw.lng()
        latSpan   = ne.lat() - sw.lat()
        {lat: sw.lat() + latSpan*Math.random(), lng: sw.lng() + lngSpan*Math.random()}
    random_point_around: (point, radius = 50)->
        unless point instanceof google.maps.LatLng
            point = new google.maps.LatLng(point.lat, point.lng)
        circle = new google.maps.Circle({center: point, radius: radius})
        @random_point(circle.getBounds())
