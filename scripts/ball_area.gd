extends Area2D
signal right_win
signal left_win
var angular_velocity: float = 1.0
var velocity: Vector2i = Vector2i(0,0)
var rng = RandomNumberGenerator.new()

@onready var rocketarea = get_parent().get_parent().get_node("Player/PlayerArea")
@onready var oparea = get_parent().get_parent().get_node("Oponent/OponentArea")
@onready var window = get_parent().get_window()
@onready var size = get_node("CollisionBall").shape.radius
var last_winner:bool=false

func _ready()-> void:
	last_winner=rng.randi_range(0,1)==0
	round_start()

#Состояние мяча в начале раунда
func round_start()->void:
	velocity=Vector2i(0,0)
	global_position=Vector2(window.size.x/2,window.size.y/2)
	await get_tree().create_timer(2).timeout
	var rand_y=rng.randi_range(-100,100)
	var rand_x=rng.randi_range(50,100)
	if last_winner:
		rand_x*=-1
	velocity = Vector2i(rand_x,rand_y)
	angular_velocity = rng.randf_range(0.1,0.5)

func _process(delta: float):
	global_position += velocity*delta*2
	rotation += angular_velocity*delta
	#Попадание в ворота игрока
	if global_position.x > (window.size.x - size):
		last_winner=true
		round_start()
		left_win.emit()
	if global_position.y > (window.size.y - size):
		velocity.y *=-1
	if global_position.y < size:
		velocity.y *=-1
	#Попадание в ворота бота
	if global_position.x < size:
		last_winner=false
		round_start()
		right_win.emit()
		

func _on_area_entered(area:Area2D)->void:
	if area==rocketarea or area==oparea:
		angular_velocity = rng.randf_range(0.1,0.5)
		velocity.x*=-1
		velocity.y=rng.randi_range(-100,100)
