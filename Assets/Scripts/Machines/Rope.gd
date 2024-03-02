extends Line2D

var velocties: PackedVector2Array

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	for p in points:
		velocties.append(Vector2.ZERO)


func setEndHook( position: Vector2 ):
	points[-1] = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(points.size()):
		if i > 0 and i != points.size()-1:
			velocties[i] += ( points[i-1] - points[i] ).normalized() * get_meta("Tension")
			velocties[i] += ( points[i+1] - points[i] ).normalized() * get_meta("Tension")
			velocties[i] *= get_meta("Damp")
			points[i] += velocties[i] * delta
