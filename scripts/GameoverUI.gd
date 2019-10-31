extends Control

var show_time = 0
var show_time_delay = 0.2
var is_show = true
var is_active = true

func _process(delta):
	if GameVariables.game_state == 2 and !is_active:
		visible = true
		is_active = true
	if GameVariables.game_state == 2 and is_active:
		show_time += delta
		if show_time >= show_time_delay:
			show_time = 0
			is_show = !is_show
			$CenterContainer/Container/lbPressRestart.visible = is_show