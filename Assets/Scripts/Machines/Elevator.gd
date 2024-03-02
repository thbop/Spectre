extends Node2D
@onready var Puller = $Puller
@onready var Rope = $Rope
@onready var Floor = $Floor

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta: float) -> void:
	#Rope.points[0] = get_global_mouse_position()
	
	
	if not Floor.is_on_floor():
		Floor.velocity.y += gravity * delta
	Floor.move_and_slide()
	
	Rope.points[0] = Puller.position
	Rope.points[-1] = Floor.position
