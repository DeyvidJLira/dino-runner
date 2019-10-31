extends Area2D#

const FLOOR = Vector2(240, 930)
const GRAVITY = 3000
const GRAVITY_MODIFIER = 2
const JUMP_HEIGHT = -1200

var in_game = false
var velocity = Vector2()
var is_running = false

func _ready():
	set_position(FLOOR)
	pass

func _physics_process(delta):	
	if in_game:
		if Input.is_action_pressed("ui_jump"):
			velocity.y += GRAVITY * delta
		else:
			velocity.y +=  GRAVITY * delta * GRAVITY_MODIFIER
			
		if Input.is_action_just_pressed("ui_jump") and position == FLOOR:
			$Sprite.play("jump")
			velocity.y = JUMP_HEIGHT
			
		position += velocity * delta
			
		if get_position().y > FLOOR.y:
			if is_running:
				$Sprite.play("run")
			else:
				$Sprite.play("walk")
			set_position(FLOOR)
			velocity = Vector2()
		
	
