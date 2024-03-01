extends CharacterBody2D
@onready var Animator = $Animator


const SPEED: int = 100


func _physics_process(delta: float) -> void:
	
	var toMouse: Vector2 = ( get_global_mouse_position() - position ).normalized()
	var toMouseRot: float = atan2( toMouse.y, toMouse.x )
	var toMouseDis: float = position.distance_to( get_global_mouse_position() )
	
	
	velocity = toMouse * SPEED * log( toMouseDis )
	
	rotation = ( toMouseRot + 1.57075 )
	
	Animator.play()
	move_and_slide()
