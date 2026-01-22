extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity = Vector2(0, 0)
	animated_player.play("idle")

func physics_update(_delta: float) -> void:
	var direction := player_direction()
	
	if direction:
		finished.emit(RUNNING)
		return
		
	if  Input.is_action_just_pressed("jump") and player.is_on_floor():
		finished.emit(JUMPING)
		return
		
	if not player.is_on_floor():
		finished.emit(FALLING)
		return
		
	if Input.is_action_just_pressed("hit"):
		finished.emit(ATTACK)
		return
