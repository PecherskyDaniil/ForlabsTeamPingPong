extends Node

var difficulty=1

var save_path="user://results.save"
var resultsList:Array = [] 
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
		
