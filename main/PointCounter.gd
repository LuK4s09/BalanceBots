extends Control
@onready var package = $"./packages/package.tscn"
var POINTS_PLAYER1: int = 0
var POINTS_PLAYER2: int = 0

@onready var Label_PointsLeft = $PointsLeft
@onready var Label_PointsRight = $PointsRight
@onready var collectSound = $collectSound

var points_for_default_package = 1

func _ready():
	update_PointLabels()


func _on_collect_area_left_side_body_entered(body):
	if body is package:
		body.queue_free()
		play_collect_sound()
		POINTS_PLAYER1 += body.default_PACKAGE_VALUE
		update_PointLabels()


func _on_collect_area_right_side_body_entered(body):
	if body is package:
		body.queue_free()
		play_collect_sound()
		POINTS_PLAYER2 += body.default_PACKAGE_VALUE
		update_PointLabels()

func play_collect_sound():
	collectSound.pitch_scale = randf_range(0.85,1.15);
	collectSound.play()

func update_PointLabels():
	Label_PointsLeft.text = str(POINTS_PLAYER1).lpad(3, "0")
	Label_PointsRight.text = str(POINTS_PLAYER2).lpad(3, "0")

func get_Points1():
	return POINTS_PLAYER1
func get_Points2():
	return POINTS_PLAYER2
