extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	animated_sprite_2d.play("run")

func physics_update(_delta: float) -> void:
	if  Input.is_action_just_pressed("jump") and player.is_on_floor():
		finished.emit(JUMPING)
		return
	
	var direction := Input.get_axis("left", "right")
	
	if !direction:
		finished.emit(IDLE)
		return
	
	if Input.is_action_just_pressed("hit"):
		finished.emit(ATTACK)
		return
	
	player.velocity.x = direction * player.SPEED
	if direction > 0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
		
	player.move_and_slide()
