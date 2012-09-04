jQuery ->
	class ALE
		constructor: (width, height)->
			ALE::__instance = this
			this.stage = new Kinetic.Stage {
				container: "ALE-canvas"
				width: width
				height: height
			}
			this.layers = []
			this.checkLayer(0)

			jQuery(this.stage.getDOM()).droppable {
				drop: (evt, ui)->
					offset = $(this).offset()
					x = ui.offset.left - offset.left
					y = ui.offset.top - offset.top
					template = ui.draggable.data("template")
					clone = template.clone()
					clone.getKNode().setPosition(x, y)
					ALE::instance().add(clone)
					clone.play(template.getDefaultAnimation())
			}

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
