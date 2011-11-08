# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    map = new Wayfarer.Views.Maps.MapView(
        el: $("#map")
        center:
            coords:
                latitude: 40.714623
                longitude: -74.006605
    )
    view = new Wayfarer.Views.Feeds.IndexView(
        map: map
        collection: new Wayfarer.Collections.TourCollection
    )
    view.render()
    window.map = view.map
