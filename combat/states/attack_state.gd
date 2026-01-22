extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	animated_player.play("punch")

func physics_update(_delta: float) -> void:
	if not animated_player.is_playing():
		finished.emit(IDLE)
