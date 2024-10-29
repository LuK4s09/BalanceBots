extends CharacterBody2D


var SPEED = 800.0
var min_y_position = 970

func _physics_process(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	
	move_and_slide()
	
	if position.y > min_y_position:
		position.y = min_y_position

