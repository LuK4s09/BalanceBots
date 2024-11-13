extends CharacterBody2D
class_name Bot

#relavant movement variables
@export var SPEED = 650.0
@export var ROTATION = 5

#Sprite Variables
var BotLookLeft : AnimatedSprite2D
var BotLookRight : AnimatedSprite2D

#PlayerNumber used for setting Inputs
enum possiblePlayers { Player1, Player2 }
@export var PlayerNumber : possiblePlayers
#Control Variables
var mvLeft : StringName
var mvRight : StringName
var mvUp : StringName
var mvDown : StringName

#Initiate input_direction
var input_direction = Vector2.ZERO

func _ready(): #called on scene entry
	#setting the Sprite and Controls based on PlayerNumber
	match PlayerNumber:
		possiblePlayers.Player1:
			mvLeft = "Player1_left"
			mvRight = "Player1_right"
			mvUp = "Player1_up"
			mvDown = "Player1_down"
			BotLookLeft = $Player1LookLeft
			BotLookRight = $Player1LookRight
		
		possiblePlayers.Player2:
			mvLeft = "Player2_left"
			mvRight = "Player2_right"
			mvUp = "Player2_up"
			mvDown = "Player2_down"
			BotLookLeft = $Player2LookLeft
			BotLookRight = $Player2LookRight
	#resetting Sprite
	BotLookLeft.hide()
	BotLookRight.show()


func lean(): #leans chracter in movement direction
	#rotating the Sprite depending on movement direction
	if velocity.x > 0 :
		rotation_degrees = ROTATION
	if velocity.x < 0 :
		rotation_degrees = -ROTATION
	if velocity.x == 0 :
		rotation_degrees = 0

func lookLeftRight(): #Switching between left & right facing Sprites
	if velocity.x > 0 :
		BotLookLeft.hide()
		BotLookRight.show()
		BotLookRight.play()
	elif velocity.x < 0 : 
		BotLookRight.hide()
		BotLookLeft.show()
		BotLookLeft.play()

func move(): #makes Character move and calls lean
	input_direction = Input.get_vector(mvLeft, mvRight, mvUp, mvDown)
	velocity = input_direction * SPEED
	move_and_slide()
	lean()


func _process(_delta): #called every frame
	move()
	lookLeftRight()
	
