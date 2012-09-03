jQuery ->
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
			options = jQuery.extend {
				layer: 0
			}, options
			this.kLayer = options.layer
			this.animations = {}
			this.currentAnimation = ""
			if typeof src == "string"
				this.image = new Image()
				this.image.src = src
			else if src instanceof HTMLImageElement
				this.image = src
			this.load =>
				this.totalWidth = this.image.width;
				this.totalHeight = this.image.height;
				if options["rows"]? and options["columns"]?
					this.width = this.totalWidth / options["columns"]
					this.height = this.totalHeight / options["rows"]
				else if options["width"]? and options["height"]?
					this.width = options["width"]
					this.height = options["height"]
				this.kSprite = new Kinetic.Sprite {
					x: options.x
					y: options.y
					image: this.image
					animations: {}
				}


		load: (func)=>
			if this.image.complete
				func()
			else
				jQuery(this.image).load(func)
				
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

