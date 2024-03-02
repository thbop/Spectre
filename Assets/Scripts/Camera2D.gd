extends Camera2D
@onready var Angel = $"../Actors/Angel"


const SPEED: int = 3

func _process(delta: float) -> void:
	position += ( Angel.position - position ) * SPEED * delta
