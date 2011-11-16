Wayfarer.Views.Feeds ||= {}

class Wayfarer.Views.Feeds.GalleryView extends Backbone.View
    constructor: (options)->
        super(options)
        @collection = options.collection
        @thumbnail_template = _.template($("#gallery_thumbnail-template").html())
        @content_templates = {}
        _(['photo']).each (content_type)=>
            @content_templates[content_type] = _.template($("#gallery_#{content_type}-template").html())
    events:
        "click #previous-page": "previous_page"
        "click #next-page": "next_page"
        "click .thumbnail": "load_item"
    load_item: (e)->
        target = $(e.target)
        thumbnail = if target.is('.thumbnail') then target else target.closest('.thumbnail')
        @$("#stage").html(
            @content_templates[thumbnail.data('type')](@collection.getByCid(thumbnail.data('id')).toJSON())
        )
    gallery_data: ->
        @collection.map (model)->
            image: "#{model.get('image_url')}?#{(new Date()).getTime()}"
            thumb: "#{model.get('thumbnail_url')}?#{(new Date()).getTime()}"
            title: model.get('title')
            description: model.get('description')
            link: model.get('url')
    make_pages: ->
        _(_(@collection.models).each_slice(4, (slice)-> slice.length and slice)).compact()
    load_page: (index = 0) =>
        return unless @pages[index]?
        @current_page = index
        @$('#thumbnails-list ul').empty()
        _(@pages[index]).each (element) =>
            @$('#thumbnails-list ul').append(
                @thumbnail_template(element.toJSON())
            )
    previous_page: -> @load_page(@current_page - 1)
    next_page: -> @load_page(@current_page + 1)
    render: ->
        self = this
        @pages = @make_pages()
        @el.html(
            $("#gallery-template").html()
        )
        @load_page(0)
