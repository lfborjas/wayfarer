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
        "click #next-item": "next_item"
        "click #previous-item": "previous_item"
    load_item: (event_or_model)->
        model = null
        unless event_or_model instanceof Backbone.Model
            target = $(event_or_model.target)
            thumbnail = if target.is('.thumbnail') then target else target.closest('.thumbnail')
            model = @collection.getByCid(thumbnail.data('id'))
        else
            model = event_or_model

        @$(".current-thumbnail").removeClass("current-thumbnail")
        @$("#thumbnail_#{model.cid}").addClass("current-thumbnail")

        if @current_page isnt model.page
            @page_at model.page

        @current_item = @collection.indexOf(model)

        @$("#stage").html(
            @content_templates[model.get('media_type')](model.toJSON())
        )
    item_at: (index)->
        item = null
        return unless (item = @collection.at(index))
        @load_item item
    next_item: -> @item_at(@current_item + 1)
    previous_item: -> @item_at(@current_item - 1)
    gallery_data: ->
        @collection.map (model)->
            image: "#{model.get('image_url')}?#{(new Date()).getTime()}"
            thumb: "#{model.get('thumbnail_url')}?#{(new Date()).getTime()}"
            title: model.get('title')
            description: model.get('description')
            link: model.get('url')
    make_pages: ->
        page = 0
        _(_(@collection.models).each_slice(4, (slice)->
            if slice.length
                _(slice).map((e) -> e.page = page)
                page += 1
                slice
        )).compact()
    page_at: (index = 0) =>
        return unless @pages[index]?
        @current_page = index
        @$('#thumbnails-list ul').empty()
        _(@pages[index]).each (element) =>
            @$('#thumbnails-list ul').append(
                @thumbnail_template(element.toJSON())
            )
    previous_page: -> @page_at(@current_page - 1)
    next_page: -> @page_at(@current_page + 1)
    render: ->
        @pages = @make_pages()
        @el.html(
            $("#gallery-template").html()
        )
        @page_at(0)
        @item_at(0)
