extends CharacterBody2D

var SPEED = 650.0
var min_y_position = 970

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide()
