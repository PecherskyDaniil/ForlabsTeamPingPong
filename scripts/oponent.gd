extends Node2D

var maxdistance =10.0
var velocity = 0.0
@onready var window = get_parent().get_window()
@onready var size = get_node("OponentArea/CollisionOponent").shape.size

#Движение в сторону мяча
func seek_target(delta,target)->void:
	var direction = target.y-global_position.y
	direction=direction/maxdistance
	velocity = direction*MainAutoload.opponent_max_speed
	if  (global_position.y+velocity*delta-size.y/2)>0 and (global_position.y+velocity*delta+size.y/2)<window.size.y:
		position.y+=velocity*delta
