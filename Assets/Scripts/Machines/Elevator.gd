extends Node2D
@onready var Puller = $Puller
@onready var Rope = $Rope
@onready var Floor = $Floor

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
const UPSPEED: int = -1400

func _process(delta: float) -> void:
	#Rope.points[0] = get_global_mouse_position()
	
	
	if not (Floor.is_on_floor() and Puller.pulling ):
		Floor.velocity.y += gravity * delta
	
	if Puller.pulling:
		Floor.velocity.y = UPSPEED * delta
	
	Floor.move_and_slide()
	
	Rope.points[0] = Puller.position
	Rope.points[-1] = Floor.position
