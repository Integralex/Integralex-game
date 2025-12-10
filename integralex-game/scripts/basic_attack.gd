extends Area2D


@export var duration = 0.25 # How long the attack lasts (seconds)
@export var damage = 10 

func _ready():
	$Timer.wait_time = duration
	$Timer.one_shot = true
	$Timer.start()

# Called when the Timer times out
func _on_timer_timeout():
	queue_free() # Remove the attack scene

# Called when the hitbox overlaps with another Area2D or CharacterBody2D
func _on_area_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		self.set_monitoring(false)
		queue_free()
