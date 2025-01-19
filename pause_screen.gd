extends Control

@onready var background = $Background
var last_frame: Texture = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_continue_pressed():
	hide()
	get_tree().paused = false
	pass # Replace with function body.

func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/startscreen.tscn")
	queue_free()
	get_tree().paused = false

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://main/main.tscn")
	queue_free()
	get_tree().paused = false
