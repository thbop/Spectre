extends CharacterBody2D
@onready var Animator = $Animator

const SPEED = 100.0
const JUMP_VELOCITY = -400.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var mousePos: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	#mousePos = get_viewport().get_mouse_position()
	
	#velocity.x = SPEED * sign( mousePos.x - position.x )
	
	Animator.flip_h = sign( velocity.x ) != 1
	
	if velocity.x != 0:
		Animator.animation = "walk"
	else:
		Animator.animation = "idle"
	
	Animator.play()
	move_and_slide()


