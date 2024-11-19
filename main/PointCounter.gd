extends Control
@onready var package = $"./packages/package.tscn"
var POINTS_PLAYER1: int
var POINTS_PLAYER2: int





func _on_collect_area_left_side_body_entered(body):
	if body is package:
		print("package entered left side")
		body.queue_free()


func _on_collect_area_right_side_body_entered(body):
	if body is package:
		print("package entered right side")
		body.queue_free()
