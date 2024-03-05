extends Camera2D
@onready var Angel = $"../Actors/Angel"


const SPEED: int = 3

func _process(delta: float) -> void:
	position += ( Angel.position - position ) * SPEED * delta
	var h: Vector2 = get_viewport().size/2
	position.x = max( position.x, h.x )
	position.y = max( position.y, h.y )
