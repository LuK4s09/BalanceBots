extends AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_continue_focus_entered():
	play()

func _on_play_again_focus_entered():
	play()
	pass

func _on_back_to_menu_focus_entered():
	play()
	pass
