extends CharacterBody2D
@onready var Animator = $Animator
@onready var Camera = $"../../Camera2D"

const SPEED: int = 100
const BASESCALE: float = 2.667

var lastPosition: Vector2 = Vector2.ZERO
var realVelocity: Vector2 = Vector2.ZERO

var fieldRadius: float = 100
var fieldDirection: int = 0

func _draw() -> void:
	draw_arc(make_canvas_position_local(position - Camera.position + Vector2(get_viewport().size)/2), fieldRadius, 0, 2*PI, 50, Color(1, 0.6, 1, 0.7), 2.0)

func _physics_process(_delta: float) -> void:
	var toMouse: Vector2 = ( get_global_mouse_position() - position ).normalized()
	var toMouseRot: float = atan2( toMouse.y, toMouse.x )
	var toMouseDis: float = position.distance_to( get_global_mouse_position() )
	
	
	velocity = toMouse * SPEED * log( toMouseDis )
	Animator.scale.y = max( BASESCALE * (realVelocity.length() / 8), BASESCALE )
	Animator.scale.x = -Animator.scale.y + BASESCALE*2
	
	rotation = ( toMouseRot + 1.57075 )
	
	if fieldDirection:
		fieldRadius += fieldDirection * 2
	if fieldRadius <= 0:
		fieldDirection = 1
	if fieldRadius >= 100:
		fieldDirection = 0

	
	Animator.play()
	queue_redraw()
	move_and_slide()

	realVelocity = position - lastPosition
	lastPosition = position


func _on_jeff_in_field() -> void:
	if fieldRadius == 100:
		fieldDirection = -1
	else:
		fieldDirection = 1
