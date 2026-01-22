extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	animated_player.play("run")

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		finished.emit(FALLING)
	
	if  Input.is_action_just_pressed("jump") and player.is_on_floor():
		finished.emit(JUMPING)
		return
	
	var direction := player_direction()
	
	if direction == 0:
		finished.emit(IDLE)
		return
	
	if Input.is_action_just_pressed("hit"):
		finished.emit(ATTACK)
		return
	
	player.velocity.x = direction * player.SPEED
	
	move_player()
