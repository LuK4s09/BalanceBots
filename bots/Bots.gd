#PARENT FOR BOT1 AND BOT2
#CHILDS INHERIT FUNCTIONS AND VARIABLES OF THE PARENT SCRIPT
extends CharacterBody2D
#relavant movement variables
var SPEED = 650.0
var ROTATION = 5

#Sprite Variables
var BotLookLeft : AnimatedSprite2D
var BotLookRight : AnimatedSprite2D

#Initiate input_direction
var input_direction = Vector2.ZERO


func get_input():
	# Directly modify the inherited velocity member
	velocity = input_direction * SPEED
	#Switching between left & right facing Sprites
	if velocity.x > 0 :
		BotLookLeft.hide()
		BotLookRight.show()
		BotLookRight.play()
	elif velocity.x < 0 : 
		BotLookRight.hide()
		BotLookLeft.show()
		BotLookLeft.play()
		
func lean(): 
	#rotating the Sprite depending on movement direction
	if velocity.x > 0 :
		rotation_degrees = ROTATION
	if velocity.x < 0 :
		rotation_degrees = -ROTATION
	if velocity.x == 0 :
		rotation_degrees = 0
