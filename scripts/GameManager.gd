extends Node2D


var level = 1
var level_elapsed = 0
var time_elapsed = 0
var speed = 100
var speed_factor = 100
var increase_factor = 10
var distance = 0
var distance_max = 0

func _ready():
	distance = 0
	distance_max = PlayerVariables.distance_max
	ui_update()

func _process(delta):
	if GameVariables.game_state == 0:
		if Input.is_action_pressed("ui_jump"):
			GameVariables.game_state = 1
			GameVariables.speed = speed
	if GameVariables.game_state == 1 and !PlayerVariables.is_dead:
		distance += delta * (speed/8)
		if distance > distance_max:
			distance_max = distance
		time_elapsed += delta
		if time_elapsed > increase_factor * level and level == 1:
			level += 1
			level_elapsed = 1
			speed += speed_factor
			GameVariables.speed = speed
			GameVariables.game_state = 1
			get_node("Dino").is_running = true
		if time_elapsed > increase_factor * level:
			level += 1
			speed += speed_factor
		ui_update()
	if GameVariables.game_state == 1 and PlayerVariables.is_dead:
		GameVariables.game_state = 2

func ui_update():
	$Canvas/HUD.update_distance(int(distance))
	$Canvas/HUD.update_distance_max(int(distance_max))