extends Button

signal play
func _on_pressed() -> void:
	play.emit()
