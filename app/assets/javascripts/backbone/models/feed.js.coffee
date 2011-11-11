class Wayfarer.Models.Feed extends Backbone.Model
    highlight: ->
        marker = @marker || {}
        Wayfarer.current_item?.dim()
        icon = @get('thumbnail_url')
        marker.setVisible true
        marker.info_window?.open()
        Wayfarer.current_item = this
        @highlighted = true
    dim: ->
        marker = @marker || {}
        marker.setVisible false
        marker.info_window?.close()
        @highlighted = false

class Wayfarer.Collections.DemoCollection extends Backbone.Collection
    model: Wayfarer.Models.Feed
    url: "/demo/feed.json"
