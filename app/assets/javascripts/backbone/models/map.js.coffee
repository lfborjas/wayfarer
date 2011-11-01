class Wayfarer.Models.Map extends Backbone.Model
  paramRoot: 'map'

  defaults:
  
class Wayfarer.Collections.MapsCollection extends Backbone.Collection
  model: Wayfarer.Models.Map
  url: '/maps'