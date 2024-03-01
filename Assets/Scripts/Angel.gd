extends CharacterBody2D

const SPEED: int = 150

func _physics_process(delta: float) -> void:
	var mousePos: Vector2 = get_viewport().get_mouse_position()
	var toMouse: Vector2 = ( mousePos - position ).normalized()
	var toMouseR: float = atan2( toMouse.y, toMouse.x )
	
	velocity = toMouse * SPEED * log( mousePos.distance_to( position ) )
	rotation = toMouseR + 1.57075

	move_and_slide()
