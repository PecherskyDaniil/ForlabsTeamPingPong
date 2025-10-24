extends Control

@onready var tree = get_node("Tree")
func _ready()->void:
	set_process(false)
	
	
func update():
	MainAutoload.load_data()
	tree.clear()
	tree.columns = 3
	tree.set_column_title(0, "Дата")
	tree.set_column_title(1, "Сложность")
	tree.set_column_title(2, "Очки")
	var columnitem = tree.create_item()
	columnitem.set_text(0,"Дата")
	columnitem.set_text(1,"Сложность")
	columnitem.set_text(2,"Очки")
	for i in range(0,MainAutoload.resultsList.size()):
		var row = MainAutoload.resultsList[i]
		var item = tree.create_item()
		item.set_text(0,row["date"])
		item.set_text(1,str(row["difficulty"]))
		item.set_text(2,str(row["points"]))



func _on_back_to_menu_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
