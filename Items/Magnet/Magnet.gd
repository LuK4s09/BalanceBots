extends Area2D
var Time_Left = 8
@onready var TimeLeftLabel = $TimeLeft
@export var attraction_force = 900
var attracted_objects : Array[PhysicsBody2D] = []

func _on_body_entered(body : PhysicsBody2D):
	if body.is_in_group("attractable"):
		attracted_objects.append(body)
		body.gravity_scale = 0


func _on_body_exited(body : PhysicsBody2D):
	if body in attracted_objects:
		attracted_objects.erase(body)
		body.gravity_scale = 1.0

func _physics_process(delta):
	for body in attracted_objects:
		if body:  # Check if the object is still valid
			# Calculate direction and apply force
			var direction = (global_position - body.global_position).normalized()
			body.position += direction * attraction_force * delta  # Adjust attraction movement
			


func _on_timer_timeout():
	Time_Left -= 1
	TimeLeftLabel.text = str(Time_Left)
	
	if Time_Left < 2:
		$Sphere.set_modulate("fe07005d")
	
	if Time_Left < 0:
		queue_free()
