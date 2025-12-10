extends Area2D

var health = 100
func take_damage(amount):
	health -= amount
	print("Enemy took ", amount, " damage. Health remaining: ", health)
	
	if health <= 0:
		die()

func die():
	print("Enemy died!")
	queue_free()
