extends Control

var next_scene = preload("res://scenes/Game.tscn")
var show_time = 0
var show_time_delay = 0.2
var is_show = true

func _process(delta):
	show_time += delta
	if show_time >= show_time_delay:
		show_time = 0
		is_show = !is_show
		$CenterContainer/Container/lbPressStart.visible = is_show
	if Input.is_action_pressed("ui_jump"):
		get_tree().change_scene_to(next_scene)

