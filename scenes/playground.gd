extends Node2D

var player_points=0
var bot_points=0
@onready var ball = get_node("Ball/BallArea")
@onready var oponent = get_node("Oponent")
@onready var op_label = get_node("OpPoints")
@onready var player_label = get_node("PlayerPoints")
func _ready():
	ball.left_win.connect(player_win)
	ball.right_win.connect(op_win)
	player_label.text="Player " + str(player_points)
	op_label.text=str(bot_points)+" Oponent"
	
func _process(delta:float)->void:
	oponent.seek_target(delta,ball.global_position)

func player_win():
	player_points+=1
	player_label.text="Player " + str(player_points)

func op_win():
	bot_points+=1
	op_label.text=str(bot_points)+" Oponent"
