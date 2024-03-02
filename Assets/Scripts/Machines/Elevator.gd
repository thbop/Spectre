extends Node2D
@onready var Rope = $Rope
@onready var Floor = $Floor
@onready var Wheel = $Wheel




func _process(delta: float) -> void:
	Rope.points[0] = Floor.position
