class Wayfarer.Models.Feed extends Backbone.Model
    highlight: ->
        marker = @marker || {}
        Wayfarer.current_item?.dim()
        icon = @get('thumbnail_url')
        marker.setIcon new google.maps.MarkerImage(icon, null, null, null, new google.maps.Size(30,30))
        marker.setZIndex google.maps.Marker.MAX_ZINDEX
        marker.info_window?.close()
        Wayfarer.current_item = this
        @highlighted = true
    dim: ->
        marker = @marker || {}
        marker.setIcon null
        marker.setZIndex 0
        marker.info_window?.close()
        @highlighted = false

class Wayfarer.Collections.TourCollection extends Backbone.Collection
    model: Wayfarer.Models.Feed
    url: "http://pictour.us/lists/new-york-city/feed.json?callback=?"
