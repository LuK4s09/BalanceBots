extends Node2D
class_name Item

var duration: int
var Name : String

func activate(body):
	pass

func deactivate():
	pass


func move():
	pass


func _on_body_entered(body):
	activate(body)
	queue_free()



func _on_timer_timeout():
	deactivate()
