extends StaticBody2D
@onready var W0 = $Wheel0
@onready var W1 = $Wheel1

var spin: bool = false



func _process(_delta: float) -> void:
	if spin:
		W0.rotate(0.04)
		W1.rotate(-0.08)
