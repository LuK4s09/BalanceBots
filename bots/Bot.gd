extends CharacterBody2D

@onready var Bot1LookRight : AnimatedSprite2D = $Bot1LookRight
@onready var Bot1LookLeft : AnimatedSprite2D = $Bot1LookLeft

var SPEED = 650.0
#var min_y_position = 970

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
	if velocity.x > 0 :
		Bot1LookLeft.hide()
		Bot1LookRight.show()
		Bot1LookRight.play()
	elif velocity.x < 0 : 
		Bot1LookRight.hide()
		Bot1LookLeft.show()
		Bot1LookLeft.play()
	
func _physics_process(delta):
	get_input()
	move_and_slide()
