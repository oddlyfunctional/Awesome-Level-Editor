YUI().use "node", "event", (Y)->
	class ALE.Sprite extends Node

		###
		#	Mandatory arguments:
		#		* x
		#		* y
		#	Optional pair of arguments:
		#		* rows
		#		* columns
		#	Or
		#		* width
		#		* height
		###
		constructor: (src, options)->
			options = Y.merge {
				layer: 1
			}, options
			this.kLayer = options.layer
			this.animations = {}
			this.currentAnimation = ""
			if typeof src == "string"
				this.image = Y.one(new Image())
				this.image.set "src", src
			else if src instanceof HTMLImageElement
				this.image = T.one(src)
			else
				this.image = src
			this.load =>
				this.totalWidth = this.image.get "width";
				this.totalHeight = this.image.get "height";
				if options["rows"]? and options["columns"]?
					this.width = this.totalWidth / options["columns"]
					this.height = this.totalHeight / options["rows"]
				else if options["width"]? and options["height"]?
					this.width = options["width"]
					this.height = options["height"]
				this.kSprite = new Kinetic.Sprite {
					x: options.x
					y: options.y
					image: this.image.getDOMNode()
					animations: {}
				}


		load: (func)=>
			if this.image.get "complete"
				func()
			else
				this.image.load(func)
				
		getLayer: ->
			this.kLayer
		
		getKNode: =>
			this.load =>
				this.kSprite

		add: (key, frames, frameRate)=>
			this.load =>
				frameRate ?= 6
				if this.width? and this.height?
					array = []
					for frame in frames
						array.push {
							x: frame * this.width % this.totalWidth
							y: Math.floor(frame * this.width / this.totalWidth) * this.height
							width: this.width
							height: this.height
						}
				else
					array = frames
				this.animations[key] = { frames: array, frameRate: frameRate }
				this.kSprite.getAnimations()[key] = array

		play: (key)=>
			this.load =>
				this.kSprite.stop()
				this.kSprite.frameRate = this.animations[key].frameRate
				this.kSprite.setAnimation(key)
				this.kSprite.start()

