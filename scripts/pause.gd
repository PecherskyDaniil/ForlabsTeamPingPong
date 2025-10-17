extends Control


signal end_pause

func _ready() -> void:
	set_process(false)

func _on_resume_button_pressed() -> void:
	end_pause.emit()
	set_process(false)


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_back_to_menu_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
