extends Node2D

#0 - INIT, 1 - IN_GAME, 2 - PAUSED

var game_state = 0
var level = 1
var level_elapsed = 0
var time_elapsed = 0
var speed = 100
var speed_factor = 100
var increase_factor = 10

func _process(delta):
	if game_state == 0:
		if Input.is_action_pressed("ui_jump"):
			get_node("ParallaxBackground").speed = speed
			get_node("Dino").in_game = true
			game_state = 1
	if game_state == 1:
		time_elapsed += delta
		if time_elapsed > increase_factor * level and level == 1:
			level += 1
			level_elapsed = 1
			speed += speed_factor
			get_node("ParallaxBackground").speed = speed
			get_node("Dino").is_running = true
		if time_elapsed > increase_factor * level:
			level += 1
			speed += speed_factor
			get_node("ParallaxBackground").speed = speed
	
