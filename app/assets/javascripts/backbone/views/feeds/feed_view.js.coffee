Wayfarer.Views.Feeds ||= {}

class Wayfarer.Views.Feeds.IndexView extends Backbone.View
    constructor: (options)->
        super(options)
        @map = options.map
        @collection = options.collection
    render: (callback)->
        self = this
        @collection.fetch
            success:(collection)->
                collection.each (element)->
                    element.marker = self.map.add_marker(element)
                self.map.fit_bounds()
                callback?.call null
