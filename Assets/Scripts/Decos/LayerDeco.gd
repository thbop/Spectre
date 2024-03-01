extends ParallaxLayer
@onready var tex = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tex.texture = load("res://Assets/Graphics/Decos/" + get_meta("DecoName") + ".png")
	#print(tex.texture)


