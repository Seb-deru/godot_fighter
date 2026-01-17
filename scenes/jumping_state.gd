extends PlayerState

const JUMP_VELOCITY = -400.0

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = JUMP_VELOCITY
	animated_sprite_2d.play("jump")

func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	player.velocity.x = player.SPEED * input_direction_x
	player.velocity.y += player.get_gravity().y * _delta
	
	if input_direction_x:
		if input_direction_x > 0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
	
	player.move_and_slide()
	

	if player.velocity.y >= 0:
		finished.emit(FALLING)
