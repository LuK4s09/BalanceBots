extends Control

@onready var background = $Background #reference to background node
var last_frame: Texture = null
# Called when the node enters the scene tree for the first time.
func _ready():
	#apply texture if it was set before scene ready
	if last_frame:
		apply_last_frame()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
		get_tree().change_scene_to_file("res://Menu/startscreen.tscn")
		queue_free()
		get_tree().paused = false

func store_last_frame(texture):
	last_frame = texture
	if is_inside_tree(): #apply texture if scene ready
		apply_last_frame()

func apply_last_frame():
	if background:
		background.texture = last_frame
	else:
		print("ERROR: Background node is missing!")
