extends PlayerState

var frame := 0
var move : MoveData

func enter(previous_state_path: String, data: MoveData = null) -> void:
	move = data
	if animated_player.has_animation(data.animation):
		animated_player.play(data.animation)

func physics_update(delta: float) -> void:
	frame += 1
	
	if frame == move.startup:
		#enable_hitboxes()
		pass
	elif frame == move.startup + move.active:
		#disable_hitboxes()
		pass
	elif frame >= move.startup + move.active + move.recovery:
		exit_to_idle()

func exit_to_idle()-> void:
	frame = 0
	finished.emit(IDLE, null)
