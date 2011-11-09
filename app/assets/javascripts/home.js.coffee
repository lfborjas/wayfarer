# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#This should be the point of entry for the entire map

$ ->
    Galleria.loadTheme('assets/galleria.classic.min.js')
    #TODO: the city should be a parameter
    #The feeds should be a list too
    map = new Wayfarer.Views.Maps.MapView(
        el: $("#map")
        center:
            coords:
                latitude: 40.714623
                longitude: -74.006605
        controls:
            'TOP_LEFT': $("#gallery")
    )
    feed = new Wayfarer.Collections.TourCollection
    markers_view = new Wayfarer.Views.Feeds.IndexView(
        map: map
        collection: feed
    )

    gallery_view = new Wayfarer.Views.Feeds.GalleryView(
        el: $("#gallery")
        collection: feed
    )

    markers_view.render(->
        gallery_view.render()
    )
