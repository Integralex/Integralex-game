extends Area2D
const basic_attack = preload("res://szenen/basic_attack.tscn")
@export var speed = 350 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var last_direction = Vector2.DOWN # Keep track of the last non-zero movement direction. 

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("attack"): 
		perform_slash_attack()
	if velocity.length() > 0:
		last_direction = velocity.normalized()
		velocity = last_direction * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
func perform_slash_attack():
	var attack_instance = basic_attack.instantiate()
	attack_instance.global_position = global_position
	var angle = last_direction.angle()
	attack_instance.rotation = angle
	get_parent().add_child(attack_instance)
	var offset_distance = 130
	attack_instance.global_position += last_direction * offset_distance
