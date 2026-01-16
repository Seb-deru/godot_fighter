extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	#animated_sprite_2d.play("fall")
	pass

		
func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
		
	if player.is_on_floor():
		finished.emit(IDLE)
		return
