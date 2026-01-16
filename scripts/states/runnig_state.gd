extends PlayerState

@export var animated_sprite_2d: AnimatedSprite2D

func enter(previous_state_path: String, data := {}) -> void:
	animated_sprite_2d.play("run")

func physics_update(_delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	
	if !direction:
		finished.emit(IDLE)
		return
	
	player.velocity.x = direction * player.SPEED
	if direction > 0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false
		
	player.move_and_slide()
