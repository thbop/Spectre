extends Node2D
@onready var Rope = $Rope
@onready var Floor = $Floor


func _process(delta: float) -> void:
	Rope.points[0] = get_global_mouse_position()
	
	Rope.points[-1] = Floor.position
