extends CharacterBody2D
@onready var W0 = $Wheel0
@onready var W1 = $Wheel1

var pulling: bool = false
var cooldown: int = 0


func _process(_delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(Vector2.ZERO, true)
	if collision:
		if collision.get_collider().is_in_group("MachineSwitch") and not cooldown:
			pulling = not pulling
			cooldown = 30
	
	if cooldown:
		cooldown -= 1
	
	if pulling:
		W0.rotate(0.04)
		W1.rotate(-0.08)
