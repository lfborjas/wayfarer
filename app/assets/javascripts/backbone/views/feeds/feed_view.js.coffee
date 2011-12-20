Wayfarer.Views.Feeds ||= {}

class Wayfarer.Views.Feeds.IndexView extends Backbone.View
    constructor: (options)->
        super(options)
        @map = options.map
        @collection = options.collection
    build_marker: (element)->
        @map.add_marker(element, false, Wayfarer.item_icon)
    render: (callback)->
        self = this
        @collection.fetch
            success:(collection)=>
                collection.each (element)=>
                    element.marker = @build_marker(element)
                @map.fit_bounds()
                callback?.call null

class Wayfarer.Views.Feeds.CommentsView extends Wayfarer.Views.Feeds.IndexView
    build_marker: (element)->
        marker = @map.add_marker(element, true, Wayfarer.comment_icon)
        marker.info_window = new google.maps.InfoWindow(
            content: Wayfarer.comment_template(element.toJSON())
            maxWidth: 300
            disableAutoPan: true
        )
        google.maps.event.addListener(
            marker,
            'click',
            () =>
                element.highlight()
        )
        marker
