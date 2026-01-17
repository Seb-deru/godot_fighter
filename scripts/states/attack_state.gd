extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	animated_sprite_2d.play("punch")

func physics_update(_delta: float) -> void:
	if not animated_sprite_2d.is_playing():
		finished.emit(IDLE)
