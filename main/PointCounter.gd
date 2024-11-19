extends Control
@onready var package = $"./packages/package.tscn"
var POINTS_PLAYER1: int
var POINTS_PLAYER2: int



func _on_area_left_body_entered(body):
	if body is package:
		print("package entered")
		body.queue_free()
