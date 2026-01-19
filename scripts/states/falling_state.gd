extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	animated_player.play("fall")

		
func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("left", "right")
	player.velocity.x = player.SPEED * input_direction_x
	player.velocity.y += player.get_gravity().y * delta
	
	#if input_direction_x:
		#if input_direction_x > 0:
			#animated_player.flip_h = true
		#else:
			#animated_player.flip_h = false
	
	player.move_and_slide()

	if Input.is_action_just_pressed("hit"):
		finished.emit(ATTACK)
		return

	if player.is_on_floor():
		if is_equal_approx(input_direction_x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)
