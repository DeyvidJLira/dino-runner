extends Control

var show_time = 0
var show_time_delay = 0.2
var is_show = true
var is_active = true

func _process(delta):
	if is_active:
		show_time += delta
		if show_time >= show_time_delay:
			show_time = 0
			is_show = !is_show
			$CenterContainer/Container/lbPressStart.visible = is_show
		if Input.is_action_pressed("ui_jump"):
			is_active = false
			visible = false		

