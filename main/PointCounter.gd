extends Control
@onready var package = $"./packages/package.tscn"
var POINTS_PLAYER1: int = 0
var POINTS_PLAYER2: int = 0

@onready var Label_PointsLeft = $PointsLeft
@onready var Label_PointsRight = $PointsRight

var points_for_default_package = 1

func _ready():
	update_PointLabels()


func _on_collect_area_left_side_body_entered(body):
	if body is package:
		body.queue_free()
		POINTS_PLAYER1 += body.default_PACKAGE_VALUE
		update_PointLabels()


func _on_collect_area_right_side_body_entered(body):
	if body is package:
		print("package entered right side")
		body.queue_free()
		POINTS_PLAYER2 += body.default_PACKAGE_VALUE
		update_PointLabels()
		print("Points Player 2: " + str(POINTS_PLAYER2))


func update_PointLabels():
	Label_PointsLeft.text = str(POINTS_PLAYER1).lpad(3, "0")
	Label_PointsRight.text = str(POINTS_PLAYER2).lpad(3, "0")
