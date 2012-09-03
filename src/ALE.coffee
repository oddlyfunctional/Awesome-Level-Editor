jQuery ->
	class ALE
		constructor: (width, height)->
			this.stage = new Kinetic.Stage {
				container: "container"
				width: width
				height: height
			}
			this.layers = []

			ALE::__instance = this

		checkLayer: (layer)=>
			unless this.layers[layer]?
				this.layers[layer] = new Kinetic.Layer()
				this.stage.add(this.layers[layer])
		
		add: (object, options)=>
			options = jQuery.extend({}, { draggable: true }, options)
			object.getKNode().setDraggable(options["draggable"])
			this.addToLayer(object.getLayer(), object.getKNode())
		
		addToLayer: (layer, object)=>
		    this.checkLayer(layer)
		    this.layers[layer].add(object)
		    
	window.ALE = ALE

	ALE::instance = ->
		unless ALE::__instance?
			ALE::__instance = new ALE(800, 600)
		return ALE::__instance
