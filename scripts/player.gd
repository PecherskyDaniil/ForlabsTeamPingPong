

extends Node2D

var velocity = 0.0
@onready var window = get_parent().get_window()
@onready var size = get_node("PlayerArea/RocketCollision").shape.size
@onready var anim=get_node("AnimationPlayer")
func _process(delta:float)->void:
	var direction = Input.get_axis("ui_up","ui_down")
	velocity = direction*MainAutoload.player_max_speed
	#Ограничение движения игрока
	if (global_position.y+velocity*delta-size.y/2)>0 and (global_position.y+velocity*delta+size.y/2)<window.size.y:
		position.y+=velocity*delta
	
	if velocity==0:
		anim.play("idle")
	else:
		anim.play("run")
	
