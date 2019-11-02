extends Node2D

signal call_restart()

var Aliens = [
	preload("res://characters/AlienA.tscn"),
	preload("res://characters/AlienB.tscn"),
	preload("res://characters/AlienC.tscn"),
	preload("res://characters/AlienD.tscn")
]

var level = 1
var time_elapsed = 0
var speed = 100
var speed_factor = 50
var increase_factor = 6
var distance = 0
var distance_max = 0

var spawn_time_elapsed = 0
var spawn_time_interval = 4

func _ready():
	distance = 0
	distance_max = PlayerVariables.distance_max
	ui_update()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true
		$Canvas/PauseUI.visible = true
	if GameVariables.game_state == 0:
		if Input.is_action_just_pressed("ui_jump"):
			GameVariables.game_state = 1
			GameVariables.speed = speed
	if GameVariables.game_state == 1 and !PlayerVariables.is_dead:
		spawn_time_elapsed += delta
		if(spawn_time_elapsed >= spawn_time_interval):
			randomize()
			var index = rand_range(0, Aliens.size())
			add_child(Aliens[index].instance())
			spawn_time_elapsed = 0
		distance += delta * (speed/8)
		if distance > distance_max:
			distance_max = distance
		time_elapsed += delta
		if time_elapsed > increase_factor and level == 1:
			level += 1
			time_elapsed = 0
			speed += speed_factor
			GameVariables.speed = speed
			get_node("Dino").is_running = true
		if time_elapsed > increase_factor:
			level += 1
			if spawn_time_interval > 0.2:
				spawn_time_interval -= 0.1
			speed += speed_factor
			GameVariables.speed = speed
			time_elapsed = 0
		ui_update()
	if GameVariables.game_state == 1 and PlayerVariables.is_dead:
		PlayerVariables.distance_max = distance_max
		$Canvas/GameoverUI.visible = true
		GameVariables.game_state = 2
		
	if GameVariables.game_state == 2 :
		if Input.is_action_just_pressed("ui_jump"):
			GameVariables.reset()
			PlayerVariables.reset()
			get_tree().reload_current_scene()

func ui_update():
	$Canvas/HUD.update_distance(int(distance))
	$Canvas/HUD.update_distance_max(int(distance_max))