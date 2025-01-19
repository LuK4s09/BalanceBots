extends Node2D

@onready var magnetSound = $magnetSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Detect Item Pick-Up
func _on_item_collider_body_entered(body):
	if body is Item_in_Arena:
		use_Item(body.Item_Type)
		body.queue_free()

func use_Item(Item_Type : String):
	match Item_Type:
		"Magnet":
			if not has_node("Magnet_on_Player"):
				var Magnet_Scene = preload("res://Items/Magnet/magnet_on_player.tscn")
				var Magnet_instance = Magnet_Scene.instantiate()
				magnetSound.play()
				add_child(Magnet_instance)
