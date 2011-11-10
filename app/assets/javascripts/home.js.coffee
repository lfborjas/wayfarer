# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#This should be the point of entry for the entire map

$ ->
    #TODO: the city should be a parameter
    #The feeds should be a list too
    map = new Wayfarer.Views.Maps.MapView(
        el: $("#map")
        center:
            coords:
                latitude: 39.57
                longitude: -75.1
        controls:
            'TOP_LEFT': $("#gallery")
    )
    feed = new Wayfarer.Collections.DemoCollection
    markers_view = new Wayfarer.Views.Feeds.IndexView(
        map: map
        collection: feed
    )

    if Wayfarer.mode and Wayfarer.mode is 'full'
        Galleria.loadTheme('assets/galleria.classic.min.js')
        gallery_view = new Wayfarer.Views.Feeds.GalleryView(
            el: $("#gallery")
            collection: feed
        )

        markers_view.render(->
            gallery_view.render()
        )
    else
        markers_view.render()
