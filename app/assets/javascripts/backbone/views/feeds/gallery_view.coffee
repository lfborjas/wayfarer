Wayfarer.Views.Feeds ||= {}

class Wayfarer.Views.Feeds.GalleryView extends Backbone.View
    constructor: (options)->
        super(options)
        @collection = options.collection
    bind_markers: ->
        @collection.each (model, index)=>
            google.maps.event.addListener(
                model.marker,
                'click',
                () =>
                    @gallery.show index
                    model.highlight()
            )
    gallery_data: ->
        @collection.map (model)->
            image: "#{model.get('image_url')}?#{(new Date()).getTime()}"
            thumb: "#{model.get('thumbnail_url')}?#{(new Date()).getTime()}"
            title: model.get('title')
            description: model.get('description')
            link: model.get('url')
    render: ->
        self = this
        @el.galleria(
            data_source: self.gallery_data()
            width: Wayfarer.dimensions.width / 3
            height: Wayfarer.dimensions.height / 3
        )
        @gallery = Galleria.get(0)

        @gallery.bind 'loadfinish', (e)=>
            @collection.models[e.index].highlight()
