jQuery ->

	class ALE.Node
		NOT_IMPLEMENTED_EXCEPTION = "Not implemented yet."
		load: (func)->
			throw NOT_IMPLEMENTED_EXCEPTION
			
		getLayer: ->
			throw NOT_IMPLEMENTED_EXCEPTION
			
		getKNode: ->
			throw NOT_IMPLEMENTED_EXCEPTION

		clone: ->
			throw NOT_IMPLEMENTED_EXCEPTION

		update: (prototype)->
			throw NOT_IMPLEMENTED_EXCEPTION

		getPreview: ->
 			throw NOT_IMPLEMENTED_EXCEPTION

		getName: ->
 			throw NOT_IMPLEMENTED_EXCEPTION

		setParent: (parent)->
			this._parent = parent

		getParent: ->
			this._parent
