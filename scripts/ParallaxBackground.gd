extends ParallaxBackground

var parallax_offset = 0

func _ready():
	pass
	
func _process(delta):
	if(GameVariables.game_state == 1):
		parallax_offset -= delta * GameVariables.speed
		set_scroll_offset(Vector2(parallax_offset, 0))
	pass

