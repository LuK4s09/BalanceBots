extends VideoStreamPlayer

@onready var black_screen = $"../BlackScreen"

# Called when the node enters the scene tree for the first time.
func _ready():
	black_screen.show()
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2.0
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_start_video"))
	timer.start()

func _start_video():
	black_screen.hide()
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	get_tree().change_scene_to_file("res://Menu/startscreen.tscn")
	pass # Replace with function body.
