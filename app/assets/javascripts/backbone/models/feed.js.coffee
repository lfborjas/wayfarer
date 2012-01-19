class Wayfarer.Models.Feed extends Backbone.Model
    initialize: ->
        @comments = new Wayfarer.Collections.CommentCollection
        @set(media_type: @get('post_type')) if @get('post_type')?

        #to take care of badly formatted titles
        if @get('title')?
            @set(title: decodeURIComponent( @get('title')?.replace(/\+/g, "%20")  ))
        if @get('description')?
            @set(description: decodeURIComponent( @get('description')?.replace(/\+/g, "%20")  ))


        #to take care of the lng vs long mishap
        unless @get('lng')
            @set(lng: @get('long'))

        #To take care of stuff like Pic Tour and Video
        @set(media_type: @get('media_type')?.replace(/\s+/, "").toLowerCase())

        #Fix zeroed points
        if (@get('lat') is 0) or (@get('lng') is 0)
            @set(Wayfarer.map.random_point(Wayfarer.philly_bounds))

        @comments.url = "#{@get('comments_url') or @get('comments')}&callback=?"
        if @get('media_type') is 'pictour'
            @photos = new Wayfarer.Collections.PhotoCollection
            @set(thumbnail_url: @get('image_url').replace("m", "t"))
            @photos.url = "http://pictour.us/tours/#{@get('meta')}.json?static_map=1&callback=?"
            @photos.fetch()
    toJSON: ->
        _(Backbone.Model.prototype.toJSON.apply(this)).extend(
            unless @get('media_type') is 'pictour' then {id: @cid} else {id: @cid, photos: @photos.toJSON(), static_map:@photos.static_map()}
        )
    highlight: ->
        marker = @marker || {}
        Wayfarer.current_item?.dim()
        icon = @get('thumbnail_url')
        marker.setVisible true
        @load_comments(->
            Wayfarer.map.map.setCenter(marker.getPosition())
            Wayfarer.map.map.panBy(- Wayfarer.gallery_width/2 , 0)
        )
        Wayfarer.current_item = this
        @highlighted = true
    dim: ->
        marker = @marker || {}
        marker.setVisible false
        @comments.each( (comment)->
            comment.marker.setVisible false
            comment.marker.info_window.close()
        )
        @highlighted = false
    load_comments: (callback)->
        (new Wayfarer.Views.Feeds.CommentsView(
            map: Wayfarer.map
            collection: @comments
        )).render(callback)

class Wayfarer.Models.Comment extends Backbone.Model
    initialize:->
        unless @get('lng')
            @set(lng: @get('long'))

        #Fix zeroed points
        if (@get('lat') is 0) or (@get('lng') is 0)
            @set(Wayfarer.map.random_point_around(Wayfarer.map.map.getCenter()))
        @default_icon = new google.maps.MarkerImage(Wayfarer.comment_icon, null, null, null, new google.maps.Size(40,40))
        @selected_icon = new google.maps.MarkerImage(@get('avatar'), null, null, null, new google.maps.Size(40,40))
    highlight: ->
        Wayfarer.current_comment?.dim()
        @marker.info_window.open(Wayfarer.map.map, @marker)
        Wayfarer.current_comment = this
    dim: ->
        @marker.info_window.close()


class Wayfarer.Collections.DemoCollection extends Backbone.Collection
    model: Wayfarer.Models.Feed
    url: "/demo/feed.json"

class Wayfarer.Collections.FeedCollection extends Backbone.Collection
    model: Wayfarer.Models.Feed

class Wayfarer.Collections.CommentCollection extends Backbone.Collection
    model: Wayfarer.Models.Comment

class Wayfarer.Models.Photo extends Backbone.Model
    initialize:->
        @thumbnail_url = @get('thumb_url')

class Wayfarer.Collections.PhotoCollection extends Backbone.Collection
    model: Wayfarer.Models.Photo
    static_map: ->
        path = encodeURIComponent(@map((photo)->"#{photo.get('latitude')},#{photo.get('longitude')}").join("|"))
        "http://maps.google.com/maps/api/staticmap?size=200x200&sensor=false&path=#{path}"
    parse: (response)->
        response.tour.things
