class Wayfarer.Models.Feed extends Backbone.Model
    initialize: ->
        @comments = new Wayfarer.Collections.CommentCollection
        @comments.url = @get('comments_url')
    highlight: ->
        marker = @marker || {}
        Wayfarer.current_item?.dim()
        icon = @get('thumbnail_url')
        marker.setVisible true
        @load_comments()
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
    load_comments: ->
        (new Wayfarer.Views.Feeds.CommentsView(
            map: Wayfarer.map
            collection: @comments
        )).render()

class Wayfarer.Models.Comment extends Backbone.Model

class Wayfarer.Collections.DemoCollection extends Backbone.Collection
    model: Wayfarer.Models.Feed
    url: "/demo/feed.json"

class Wayfarer.Collections.CommentCollection extends Backbone.Collection
    model: Wayfarer.Models.Comment
