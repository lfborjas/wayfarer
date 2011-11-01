Wayfarer.Views.Feeds ||= {}

class Wayfarer.Views.Feeds.IndexView extends Backbone.View
    constructor: (options)->
        super(options)
        @map = options.map
        @collection = options.collection
    render: ->
        self = this
        @collection.fetch
            success:(collection)->
                collection.each (element)->
                    console.log self.map.add_marker(element)
