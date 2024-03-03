extends Node2D
@onready var Puller = $Puller
@onready var Rope = $Rope
@onready var Platform = $Platform

func _ready() -> void:
	Puller.position.y -= get_meta("PullerYOffset") * 5

func _process(delta: float) -> void:
	
	
	if Puller.pulling:
		Platform.velocity.y = Platform.UPSPEED

	
	Rope.points[0] = Puller.position
	Rope.points[-1] = Platform.position
