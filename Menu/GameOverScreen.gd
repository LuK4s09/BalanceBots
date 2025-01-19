extends Control

@onready var background = $Background #reference to background node
var last_frame: Texture = null
@onready var WinText = $WinText
#Player Points
var pointcounter
var pointsplayer1 : int
var pointsplayer2  : int

# Called when the node enters the scene tree for the first time.
func _ready():
	#apply texture if it was set before scene ready
	if last_frame:
		apply_last_frame()
	
	pointcounter = get_tree().root.get_node("Main/PointCounter")
	if pointcounter:
		pointsplayer1 = pointcounter.get_Points1()
		pointsplayer2 = pointcounter.get_Points2()
	else:
		pointsplayer1 = 0
		pointsplayer2 = 0
	if pointsplayer1 > pointsplayer2:
		WinText.set_text("PLAYER 1 WINS!")
		WinText.label_settings.set_font_color("63dcfb")
	elif pointsplayer2 > pointsplayer1:
		WinText.set_text("PLAYER 2 WINS!")
		WinText.label_settings.set_font_color("fbd071")
	elif pointsplayer1 == pointsplayer2:
		WinText.set_text("DRAW")
	
	$Buttons/PlayAgain.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
		get_tree().change_scene_to_file("res://Menu/startscreen.tscn")
		queue_free()
		get_tree().paused = false

func store_last_frame(texture):
	last_frame = texture
	if is_inside_tree(): #apply texture if scene ready
		apply_last_frame()

func apply_last_frame():
	if background:
		background.texture = last_frame
	else:
		print("ERROR: Background node is missing!")


func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://main/main.tscn")
	queue_free()
	get_tree().paused = false
