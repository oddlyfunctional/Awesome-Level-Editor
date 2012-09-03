
jQuery ->
#	window.player = new ALE.Sprite("assets/player.jpg", { x: 200, y: 200, rows: 2, columns: 5 })
	window.player = new ALE.Sprite(jQuery("#teste")[0], { x: 200, y: 200, rows: 2, columns: 5 })
	player.load ->
		ALE::instance().add(player)
		player.add("run", [i for i in 0..9], 21)
		player.play("run")

