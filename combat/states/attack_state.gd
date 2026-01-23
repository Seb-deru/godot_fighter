extends PlayerState

func enter(previous_state_path: String, data: MoveData = null) -> void:
	if animated_player.has_animation(data.animation):
		animated_player.play(data.animation)
	else:
		animated_player.stop()

func physics_update(_delta: float) -> void:
	if not animated_player.is_playing():
		finished.emit(IDLE, null)
