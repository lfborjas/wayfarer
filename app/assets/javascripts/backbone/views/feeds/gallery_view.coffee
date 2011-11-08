Wayfarer.Views.Feeds ||= {}

class Wayfarer.Views.Feeds.GalleryView extends Backbone.View
    constructor: (options)->
        super(options)
        @collection = options.collection
    gallery_data: ->
        @collection.map (model)->
            image: model.get('image_url')
            thumb: model.get('thumbnail_url')
            title: model.get('title')
            description: model.get('description')
            link: model.get('url')
    render: ->
        self = this
        @el.galleria(
            data_source: self.gallery_data()
            width: 400
            height: 350
        )
