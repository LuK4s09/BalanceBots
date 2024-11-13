extends "res://bots/Bots.gd"

func get_input():
	# Update input_direction
	input_direction = Input.get_vector("Player1_left", "Player1_right", "Player1_up", "Player1_down")
	# Update Sprites
	BotLookRight = $Bot1LookRight
	BotLookLeft = $Bot1LookLeft
	
	super.get_input()  # Call parent method to update velocity

func lean():
	super.lean()  # Call parent lean method

func _process(_delta):
	lean()
	get_input()
	move_and_slide()  # No need to pass velocity explicitly, as it's already handled by CharacterBody2D
