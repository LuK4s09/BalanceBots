extends RigidBody2D
var FAlL_SPEED = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_sleeping(false)
	
	linear_velocity.y += FAlL_SPEED
	

#func _on_body_entered(body):
#	if body.name == "Bot":
#		gravity_scale = 0.1
