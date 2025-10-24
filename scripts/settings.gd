extends Control

@onready var close_button=$Container/VBoxContainer/CloseButton
@onready var slider=$Container/VBoxContainer/HSlider
signal exit_settings_menu

func _ready() -> void:
	slider.value=MainAutoload.difficulty
	set_process(false)
	
func _on_close_button_pressed() -> void:
	exit_settings_menu.emit()
	set_process(false)


func _on_h_slider_value_changed(value: float) -> void:
	MainAutoload.difficulty=int(value)
	MainAutoload.change_difficulty(MainAutoload.difficulty)
