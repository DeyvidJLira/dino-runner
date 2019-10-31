extends Control

var next_scene = preload("res://scenes/Game.tscn")

func _process(delta):
	if Input.is_action_pressed("ui_jump"):
		get_tree().change_scene_to(next_scene)

