extends CharacterBody2D

@onready var Animator = $Animator
@onready var Angel = $"../Angel"


const SPEED = 100.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var tapCooldown: int = 0

var lastPosition: Vector2 = Vector2.ZERO
var realVelocity: Vector2 = Vector2.ZERO



func _physics_process(delta: float) -> void:
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	var dirX: int = sign((Angel.position - position).x)
	if not tapCooldown and ( position.distance_to(Angel.position) < 200 ):
		if realVelocity.x:
			velocity.x = 0
			tapCooldown = 120
		else:
			velocity.x = SPEED * dirX
			tapCooldown = 120
	
	if tapCooldown:
		tapCooldown -= 1
		
	
	if velocity.x != 0:
		Animator.animation = "walk"
	else:
		Animator.animation = "idle"
	
	Animator.flip_h = sign( velocity.x ) != 1
	
	Animator.play()
	move_and_slide()
	realVelocity = position - lastPosition
	lastPosition = position
