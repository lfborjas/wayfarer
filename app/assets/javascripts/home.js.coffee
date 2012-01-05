# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#This should be the point of entry for the entire map

_.templateSettings =
    interpolate: /\{\{(.+?)\}\}/g
    evaluate: /\{%([\s\S]+?)%\}/g

_.mixin(
    each_slice: (obj, slice_size, iterator, context)->
        collection = obj.map (item)-> item
        if typeof collection.slice isnt 'undefined'
            for i in [0 .. Math.ceil(collection.length/slice_size)]
                iterator.call(context, _(collection).slice(i * slice_size, (i * slice_size) + slice_size), obj)
)


$.ajaxSetup(
    username: "root"
    password: "ph1lly!"
)

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
    Wayfarer.map = map
    Wayfarer.comment_template = _.template($("#comment-template").html())
    Wayfarer.gallery_width = $("#gallery").width()

    feed = new Wayfarer.Collections.FeedCollection
    feed.url = "http://root:ph1lly!@dev.phillyinfocus.com/content-data/?callback=?&"+$.param(Wayfarer.config)

    markers_view = new Wayfarer.Views.Feeds.IndexView(
        map: map
        collection: feed
    )

    if Wayfarer.mode and Wayfarer.mode is 'full'
        gallery_view = new Wayfarer.Views.Feeds.GalleryView(
            el: $("#gallery")
            collection: feed
        )

        markers_view.render(->
            gallery_view.render()
        )
    else
        markers_view.render()
