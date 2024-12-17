extends Node
var Item_in_Arena_Scene = preload("res://Items/Item_in_Arena/item_in_arena.tscn")

func _on_timer_timeout():
	#instantiate Item
	var Item = Item_in_Arena_Scene.instantiate()
	#Set Item Position
	Item.position = Vector2(randf_range(400, 1500),-100)
	#add to Scene Tree
	get_parent().add_child(Item)

