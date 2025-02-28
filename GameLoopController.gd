extends Node

@export var time_left: int = 99 # Lenght of one game

@onready var TimerLabel = $TimerLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	update_TimerLabel() #initialize the label with the starting time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("Pause"):
		show_PauseScreen()

func _on_timer_timeout(): #Timer is set to 1s, so this function will be called every second
	#Decrease time left
	time_left -= 1
	update_TimerLabel()
	
	if time_left == 15:
		activate_KistenRausch()
	
	#Stop Timer if time runs out
	if time_left <= 0:
		$Timer.stop()
		switch_to_GameOver()

func update_TimerLabel():
	TimerLabel.text = str(time_left)

func show_PauseScreen():
	$almost_over_Sirene.deactivate_filter()
	var last_frame = get_viewport().get_texture()
	var pause_screen = load("res://Menu/pause_screen.tscn").instantiate()
	get_tree().paused = true
	get_tree().root.add_child(pause_screen)

func switch_to_GameOver():
	$almost_over_Sirene.deactivate_filter()
	#get last frame
	var last_frame = get_viewport().get_texture()
	
	#load GameOverScreen
	var game_over_screen = load("res://Menu/game_over_screen.tscn").instantiate()
	
	#Pass last frame to GameOverScreen
	game_over_screen.store_last_frame(last_frame)

	
	#Switch to the Game Over scene
	get_tree().paused = true
	get_tree().root.add_child(game_over_screen)

func activate_KistenRausch():
	var package_spawner_timer = get_node("/root/Main/PackageSpawner/Timer")
	package_spawner_timer.set_wait_time(0.5)
	$almost_over_Sirene.activate()
