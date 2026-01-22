extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	animated_player.play("fall")

	
func physics_update(delta: float) -> void:
	var input_direction_x := player_direction()
	apply_gravity(delta)

	if Input.is_action_just_pressed("attack_light"):
		finished.emit(ATTACK)
		return

	if player.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)
			
	move_player()
