extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	animated_player.play("run")

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		finished.emit(FALLING)
	
	if  Input.is_action_just_pressed("jump") and player.is_on_floor():
		finished.emit(JUMPING)
		return
	
	var direction := Input.get_axis("left", "right")
	
	if direction == 0:
		finished.emit(IDLE)
		return
	
	if Input.is_action_just_pressed("hit"):
		finished.emit(ATTACK)
		return
	
	player.velocity.x = direction * player.SPEED
	
	if direction != 0:
		var new_facing = direction
		if new_facing != player.facing_direction:
			player.facing_direction = new_facing
			player.rotate(PI)
			player.scale.y = abs(player.scale.y) * -new_facing
		
	player.move_and_slide()
