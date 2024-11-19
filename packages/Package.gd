extends RigidBody2D

class_name package

@onready var displayPointsLeft = $"./PointsLeft"
@onready var displayPointsRight = $"./PointsRight"

@export var pointsLeft = 0
@export var pointsRight = 0

#displayPointsLeft.set_text(str(pointsLeft))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	despawn_if_below_area()

func despawn_if_below_area():
	if position.y > 1200:
		queue_free()


func _on_collect_area_left_area_entered(area):
	print("Package collected for player left")
	pointsLeft += 1
	pass # Replace with function body.


func _on_collect_area_right_area_entered(area):
	print("Package collected for player right")
	pointsRight += 1
	pass # Replace with function body.
