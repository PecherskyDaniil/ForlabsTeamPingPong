extends Node2D


@onready var playground=preload("res://scenes/playground.tscn")
@onready var settings=$settings
@onready var main_menu=$MarginContainer

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(playground)
	

func _on_exit_button_pressed() -> void:
	get_tree().quit()



func _on_settings_button_pressed() -> void:
	main_menu.visible=false
	settings.set_process(true)
	settings.visible=true


func _on_settings_exit_settings_menu() -> void:
	settings.visible=false
	settings.set_process(false)
	main_menu.visible=true
	
