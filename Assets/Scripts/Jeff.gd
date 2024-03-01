extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var animator = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var mousePos: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	#mousePos = get_viewport().get_mouse_position()
	
	#velocity.x = SPEED * sign( mousePos.x - position.x )
	
	animator.flip_h = sign( velocity.x ) != 1
	
	if velocity.x != 0:
		animator.animation = "walk"
	else:
		animator.animation = "idle"
	
	animator.play()
	move_and_slide()


