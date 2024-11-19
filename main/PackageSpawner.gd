extends Node2D

@export var Package = preload("res://packages/package.tscn")

func _on_timer_timeout():
		#instance package scene
	var package = Package.instantiate()
	#set spawn position random
	package.position = Vector2(randf_range(400, 1500),-100)
	#add package to scene
	get_parent().add_child(package)
