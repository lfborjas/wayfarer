class Wayfarer.Models.Feed extends Backbone.Model

class Wayfarer.Collections.TourCollection extends Backbone.Collection
    model: Wayfarer.Models.Feed
    url: "http://pictour.us/lists/featured/feed.json?callback=?"
