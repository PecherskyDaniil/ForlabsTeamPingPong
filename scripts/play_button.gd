extends Button


signal play
func _on_pressed() -> void:
	#play.emit()
	get_tree().change_scene_to_file("res://scenes/playground.tscn")
