jQuery ->
	class ALE.Sprite

		###
		#	Mandatory arguments:
		#		* x
		#		* y
		#	Choose one pair of arguments:
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
			this.layer = options.layer
			this.animations = {}
			this.currentAnimation = ""
			this.image = jQuery(new Image())
			this.image.load =>
				this.totalWidth = this.image[0].width;
				this.totalHeight = this.image[0].height;
				if options["rows"]? and options["columns"]?
					this.width = this.totalWidth / options["columns"]
					this.height = this.totalHeight / options["rows"]
				else
					this.width = options["width"]
					this.height = options["height"]
				this.sprite = new Kinetic.Sprite {
					x: options.x
					y: options.y
					image: this.image[0]
					animations: {}
				}
				ALE::instance().addToLayer(this.layer, this.sprite)

			this.image.attr "src", src

		runAfterLoad: (func)=>
			if this.image[0].complete
				func()
			else
				this.image.load(func)

		add: (key, frames, frameRate)=>
			this.runAfterLoad =>
				frameRate ?= 6
				array = []
				for frame in frames
					array.push {
						x: frame * this.width % this.totalWidth
						y: Math.floor(frame * this.width / this.totalWidth) * this.height
						width: this.width
						height: this.height
					}
				this.animations[key] = { frames: array, frameRate: frameRate }
				this.sprite.getAnimations()[key] = array

		play: (key)=>
			this.runAfterLoad =>
				this.sprite.stop()
				this.sprite.frameRate = this.animations[key].frameRate
				this.sprite.setAnimation(key)
				this.sprite.start()
