extends CharacterBody2D

var JUMP_SPEED = 100
var SPEED = 800.0
var min_y_position = 970

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	#Input for left & right movement
	if Input.is_action_pressed("ui_left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x += SPEED
	
	
	# min height
	if position.y > min_y_position:
		position.y = min_y_position
	
	#Jump-Ability 
	if Input.is_action_pressed("ui_accept"):
		velocity.y -= JUMP_SPEED
	 
	move_and_slide()




func _on_package_body_entered(body):
	pass
