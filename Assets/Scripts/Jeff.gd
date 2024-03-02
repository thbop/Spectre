extends CharacterBody2D

@onready var Animator = $Animator


const SPEED = 100.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	var lastCollision: KinematicCollision2D = get_last_slide_collision()
	if lastCollision:
		var dirX: float = lastCollision.get_normal().x
		if dirX and lastCollision.get_collider().is_in_group("JeffSwitch"):
			velocity.x = SPEED * dirX
	
	if velocity.x != 0:
		Animator.animation = "walk"
	else:
		Animator.animation = "idle"
	
	Animator.flip_h = sign( velocity.x ) != 1
	
	Animator.play()
	move_and_slide()


