extends Node

#0 - INIT, 1 - IN_GAME, 2 - GameOver
var game_state = 0
var speed = 0

func reset():
	game_state = 0
	speed = 0