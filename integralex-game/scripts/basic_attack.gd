extends Area2D


@export var duration = 0.25 # How long the attack lasts (seconds)
@export var damage = 10 

func _ready():
	$Timer.wait_time = duration
	$Timer.one_shot = true
	$Timer.start()
	
	# Connect the body_entered signal to handle hitting enemies
	body_entered.connect(_on_body_entered) 

# Called when the Timer times out
func _on_timer_timeout():
	queue_free() # Remove the attack scene

# Called when the hitbox overlaps with another Area2D or CharacterBody2D
func _on_body_entered(body):
	# For now, just print the name of the object hit
	print("Hit: ", body.name) 
	# In a real game, you would call a function on the body 
	# like 'body.take_damage(damage)'
