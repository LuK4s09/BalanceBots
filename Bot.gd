extends CharacterBody2D

var SPEED = 500.0
var min_y_position = 970

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	#Input for left & right movement
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.y -= SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y += SPEED
	
	
	# min height
	if position.y > min_y_position:
		position.y = min_y_position
	
	 
	move_and_slide()
