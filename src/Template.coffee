
jQuery ->
	class ALE.Template
		constructor: (prototype) ->
			this._prototype = prototype;
			this._clones = [];

		getPlaceholder: ->
			unless this._placeholder?
				this.setPlaceholder(jQuery("<a>" + this._prototype.getName() + "</a>"));
			this._placeholder

		setPlaceholder: (placeholder)->
			this._placeholder = placeholder
			this._placeholder.data("template", this)
			this._placeholder.draggable {
				revert: true
				helper: "clone"
			}

		setDefaultAnimation: (anim)->
			this._defaultAnimation = anim

		getDefaultAnimation: ->
			this._defaultAnimation

		clone: ->
			_clone = this._prototype.clone()
			this._clones.push(_clone)
			_clone.setParent(this)
			_clone

		prototypeChanged: ->
			for _clone in this._clones
				_clone.update(this._prototype)

			
