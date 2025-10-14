extends Button

signal open_settings



func _on_pressed() -> void:
	open_settings.emit()
