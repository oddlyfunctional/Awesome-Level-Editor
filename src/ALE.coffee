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
			
		addToLayer: (layer, object)=>
			unless this.layers[layer]?
				this.layers[layer] = new Kinetic.Layer()
				this.stage.add(this.layers[layer])
			this.layers[layer].add(object)
	window.ALE = ALE

	ALE::instance = ->
		unless ALE::__instance?
			ALE::__instance = new ALE(800, 600)
		return ALE::__instance
