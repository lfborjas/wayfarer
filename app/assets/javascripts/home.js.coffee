# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    map = new Wayfarer.Views.Maps.MapView(
        el: $("#map")
        center:
            coords:
                latitude: 39.87
                longitude: -75.24
    )
    view = new Wayfarer.Views.Feeds.IndexView(
        map: map
        collection: new Wayfarer.Collections.TourCollection
    )
    view.render()
    view.map.fit_bounds()
