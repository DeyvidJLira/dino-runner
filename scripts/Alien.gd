extends Area2D

onready var player = get_parent().get_node("Dino")

var is_dead = false
var ground = Vector2(2100, 928)
var speed_factor = 3

func _ready():
	set_position(ground)
	
func _physics_process(delta):
	if !is_dead:
		set_position(position + GameVariables.speed * speed_factor * Vector2.LEFT * delta)

func _on_AlienA_area_entered(area):
	if area.name == "Dino":
		$Sprite.play("die")
		player.die()
		is_dead = true


func _on_Sprite_animation_finished():
	if is_dead:
		queue_free()
