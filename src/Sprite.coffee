jQuery ->
	class ALE.Sprite
		constructor: (src, x, y, width, height, layer)->
			layer ?= 0
			this.layer = layer
			this.width = width
			this.height = height
			this.animations = {}
			this.currentAnimation = ""
			this.image = jQuery(new Image())
			this.image.load =>
				this.totalWidth = this.image[0].width;

				this.sprite = new Kinetic.Sprite {
					x: x
					y: y
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
