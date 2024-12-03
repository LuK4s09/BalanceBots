extends StaticBody2D
class_name Item_in_Arena

enum Item_Types {Magnet}
var Item_Type : String

#Movement Variables
var SPEED = Vector2(0, 5)
# Called when the node enters the scene tree for the first time.
func _ready():
	var Item_Keys = Item_Types.keys()
	Item_Type = Item_Keys[randi() %Item_Keys.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move
	move_and_collide(SPEED)
