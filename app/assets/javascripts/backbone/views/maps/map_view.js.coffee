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


