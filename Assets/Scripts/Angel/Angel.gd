extends CharacterBody2D
@onready var Animator = $Animator

const SPEED: int = 100
const BASESCALE: float = 2.667

var lastPosition: Vector2 = Vector2.ZERO
var realVelocity: Vector2 = Vector2.ZERO



func _physics_process(_delta: float) -> void:
	var toMouse: Vector2 = ( get_global_mouse_position() - position ).normalized()
	var toMouseRot: float = atan2( toMouse.y, toMouse.x )
	var toMouseDis: float = position.distance_to( get_global_mouse_position() )

	
	velocity = toMouse * SPEED * log( toMouseDis )
	Animator.scale.y = max( BASESCALE * (realVelocity.length() / 8), BASESCALE )
	Animator.scale.x = -Animator.scale.y + BASESCALE*2
	
	rotation = ( toMouseRot + 1.57075 )
	

		
	
	Animator.play()
	move_and_slide()
	realVelocity = position - lastPosition
	lastPosition = position
