

extends Node2D

const SPEED = 200.0
var velocity = 0.0
@onready var window = get_parent().get_window()
@onready var size = get_node("PlayerArea/RocketCollision").shape.size
func _process(delta:float)->void:
	var direction = Input.get_axis("ui_up","ui_down")
	velocity = direction*SPEED
	if (global_position.y+velocity*delta-size.y/2)>0 and (global_position.y+velocity*delta+size.y/2)<window.size.y:
		position.y+=velocity*delta
	
