extends ParallaxBackground

var parallax_offset = 0
var speed = 0

func _ready():
	pass
	
func _process(delta):
	parallax_offset -= delta * speed
	set_scroll_offset(Vector2(parallax_offset, 0))
	pass

