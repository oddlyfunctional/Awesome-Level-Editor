
jQuery ->
	player = new ALE.Sprite("assets/player.png", 200, 200, 48, 79)
	player.add("run", [108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119], 21)
	player.play("run")

