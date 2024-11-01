extends RigidBody2D

@onready var displayPointsLeft = $"./PointsLeft"
@onready var displayPointsRight = $"./PointsRight"

@export var pointsLeft = 0
@export var pointsRight = 0

#displayPointsLeft.set_text(str(pointsLeft))

# Called when the node enters the scene tree for the first time.
func _ready():
	can_sleep = false
	#prevents package from freezing in air

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_collect_area_left_area_entered(area):
	print("Package collected for player left")
	pointsLeft += 1
	pass # Replace with function body.


func _on_collect_area_right_area_entered(area):
	print("Package collected for player right")
	pointsRight += 1
	pass # Replace with function body.
