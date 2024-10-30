extends Node2D

@export var Package: PackedScene

var timer: Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	#get the Timer node
	timer = $Timer
	#connect the timeout signal to the spawn_enemy function
	timer.timeout.connect(Callable(self, "_on_Timer_timeout"))
	#start timer
	timer.start()

func _on_Timer_timeout():
	#instance package scene
	var package = Package.instantiate()
	#set spawn position random
	package.position = Vector2(randf_range(0, 1920),-100)
	#add package to scene
	get_parent().add_child(package)
	
