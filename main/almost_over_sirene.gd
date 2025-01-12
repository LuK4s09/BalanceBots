extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func activate():
	$Alarm.play()
	$BlinkTimer.start()


func _on_blink_timer_timeout():
	if $Filter.visible:
		$Filter.hide()
	else:
		$Filter.show()
	
