extends PlayerState

const JUMP_VELOCITY = -500.0

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = JUMP_VELOCITY
	animated_player.play("jump")

func physics_update(delta: float) -> void:
	apply_gravity(delta)
	
	if player.velocity.y >= 0:
		finished.emit(FALLING)
		return
		
	if Input.is_action_just_pressed("attack_light"):
		finished.emit(ATTACK)
		return

	move_player()
