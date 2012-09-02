
jQuery ->
	player = new ALE.Sprite("assets/player.jpg", { x: 200, y: 200, rows: 2, columns: 5 })
	player.add("run", [i for i in 0..9], 21)
	player.play("run")

