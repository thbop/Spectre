extends CharacterBody2D

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
const UPSPEED: int = -50

var hitTop: bool = false
var hitBottom: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide( velocity * delta )
	
	if collision:
		var collisionNormal: Vector2 = collision.get_normal()
		hitTop = collisionNormal.y == 1
		hitBottom = collisionNormal.y == -1
	else:
		hitTop = false
		hitBottom = false
	
	if not hitBottom:
		velocity.y += gravity * delta
	
	
