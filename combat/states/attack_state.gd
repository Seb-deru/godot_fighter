extends PlayerState

func enter(previous_state_path: String, data: MoveData = null) -> void:
	animated_player.play(data.animation)

func physics_update(_delta: float) -> void:
	if not animated_player.is_playing():
		finished.emit(IDLE, null)
