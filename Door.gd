extends StaticBody2D
@onready var DOOR_SHAPE = $CollisionShape2D
var DOOR_HEIGHT


# Called when the node enters the scene tree for the first time.
func _ready():
	if DOOR_SHAPE and DOOR_SHAPE.shape is RectangleShape2D:
		DOOR_HEIGHT = DOOR_SHAPE.shape.extents.y * 2
		print(DOOR_HEIGHT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is package:
		position.y -= DOOR_HEIGHT


func _on_area_2d_body_exited(body):
	if body is package:
		position.y += DOOR_HEIGHT
