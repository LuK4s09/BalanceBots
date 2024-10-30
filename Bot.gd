extends CharacterBody2D

var SPEED = 200.0
var min_y_position = 970

func _physics_process(delta):
	var input_dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.y += 1
	if Input.is_action_pressed("ui_up"):
		input_dir.y -= 1
	
	input_dir = input_dir.normalized()
	velocity = input_dir * SPEED
	
	#move_and_slide()
	
	# min height
	if position.y > min_y_position:
		position.y = min_y_position
	
	 
	move_and_slide()
