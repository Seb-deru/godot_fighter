extends RigidBody2D

var health := 20

func take_damage(damage):
	health -= damage
	
	if(health <= 0):
		print("killed")
		queue_free()
