class Wayfarer.Models.Feed extends Backbone.Model

class Wayfarer.Collections.TourCollection extends Backbone.Collection
    model: Wayfarer.Models.Feed
    url: "http://pictour.us/lists/new-york-city/feed.json?callback=?"
