extends Node

var difficulty=1

var save_path="user://results.save"
var resultsList:Array = [] 
var PLAYTIME=60
var player_max_speed=400
var ball_max_speed=250
var opponent_max_speed=40


var cat_ball_texture=load("res://assets/ball/cat-ball.png")
var iszf_ball_texture=load("res://assets/ball/iszf-ball.png")
var pull_req_ball_texture=load("res://assets/ball/preq-ball.png")

var ball_texture=cat_ball_texture
var oponent_idle="bos1_idle"
var oponent_run="bos1_run"

func change_difficulty(diff:int):
	if diff<2:
		ball_texture=cat_ball_texture
		oponent_idle="bos1_idle"
		oponent_run="bos1_run"
		ball_max_speed=250
		opponent_max_speed=40
	elif diff==2:
		ball_texture=iszf_ball_texture
		oponent_idle="bos2_idle"
		oponent_run="bos2_run"
		ball_max_speed=300
		opponent_max_speed=50
	else:
		ball_texture=pull_req_ball_texture
		oponent_idle="bos3_idle"
		oponent_run="bos3_run"
		ball_max_speed=350
		opponent_max_speed=70
func add_to_results(date:String,points: int, diff: int) -> void:
	var entry = { "date":date,"difficulty": diff, "points": points }
	resultsList.append(entry)
	resultsList.sort_custom(func(a,b): return a["points"] > b["points"])
func save_data(points: int):
	add_to_results(Time.get_datetime_string_from_system(), points, difficulty)
	var filewrite = FileAccess.open(MainAutoload.save_path, FileAccess.WRITE)
	filewrite.store_var(resultsList)
func load_data():
	if (FileAccess.file_exists(MainAutoload.save_path)):
		var fileread = FileAccess.open(MainAutoload.save_path, FileAccess.READ)
		resultsList=fileread.get_var()
		
