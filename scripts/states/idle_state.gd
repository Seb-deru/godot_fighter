extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity = Vector2(0, 0)
	animated_sprite_2d.play("iddle")

func physics_update(_delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	
	if direction:
		finished.emit(RUNNING)
		
	if  Input.is_action_just_pressed("jump") and player.is_on_floor():
		finished.emit(JUMPING)
		return
		
	if not player.is_on_floor():
		finished.emit(FALLING)
		return
