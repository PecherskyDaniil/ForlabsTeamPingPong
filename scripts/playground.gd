extends Node2D

var player_points=0
const PLAYTIME = 120
var time = PLAYTIME
@onready var ball = get_node("Ball/BallArea")
@onready var oponent = get_node("Oponent")
@onready var op_label = get_node("OpPoints")
@onready var player_label = get_node("PlayerPoints")
@onready var difficulty_label=get_node("DifficultyLabel")
@onready var pause_button=get_node("PauseButton")
@onready var pause_scene=$pause
@onready var results_scene=get_node("Results")
func _ready():
	$Timer.start()
	ball.left_win.connect(player_win)
	ball.right_win.connect(op_win)
	player_label.text="Points: " + str(player_points)
	difficulty_label.text="Difficulty: "+str(MainAutoload.difficulty)

func _process(delta:float)->void:
	oponent.seek_target(delta,ball.global_position)
	$Label.set_text("Time left: "+str(int(round($Timer.get_time_left()))))
	if int(round($Timer.get_time_left()))<1:
		MainAutoload.save_data(player_points)
		print(MainAutoload.resultsList)
		results_scene.update()
		results_scene.visible=true
		get_tree().paused=true
		results_scene.set_process(true)
		
#Засчитать очко игроку
func player_win():
	player_points+=1
	player_label.text="Points: " + str(player_points)
#Засчитать очко боту
func op_win():
	player_points-=1
	player_label.text="Points: " + str(player_points)

func _on_pause_button_pressed() -> void:
	pause_scene.visible=true
	get_tree().paused=true
	pause_button.visible=false
	pause_scene.set_process(true)


func _on_pause_end_pause() -> void:
	get_tree().paused=false
	pause_scene.visible=false
	pause_scene.set_process(false)
	pause_button.visible=true
	
