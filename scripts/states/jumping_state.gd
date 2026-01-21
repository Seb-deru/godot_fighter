extends PlayerState

const JUMP_VELOCITY = -500.0

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = JUMP_VELOCITY
	animated_player.play("jump")

func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	player.velocity.x = player.SPEED * input_direction_x
	player.velocity.y += player.get_gravity().y * _delta
	
	if input_direction_x != 0:
		var new_facing = input_direction_x
		if new_facing != player.facing_direction:
			player.facing_direction = new_facing
			player.rotate(PI)
			player.scale.y = abs(player.scale.y) * -new_facing
	
	player.move_and_slide()
	
	if player.velocity.y >= 0:
		finished.emit(FALLING)
		return
		
	if Input.is_action_just_pressed("hit"):
		finished.emit(ATTACK)
		return
