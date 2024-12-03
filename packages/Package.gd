extends RigidBody2D

class_name package

@export var default_PACKAGE_VALUE = 1
@export var golden_PACKAGE_VALUE = 3
@export var golden_PACKAGE_posibility= 20

#Sounds
@onready var bonksound = $bonksound

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 100 < golden_PACKAGE_posibility:
		default_PACKAGE_VALUE = golden_PACKAGE_VALUE
		set_modulate(Color( 255, 255, 0, 255))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	despawn_if_below_area()

func despawn_if_below_area():
	if position.y > 1200:
		queue_free()

#play Sound on Collision
func _on_body_entered(body):
	bonksound.play()
