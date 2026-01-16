extends PlayerState

const JUMP_VELOCITY = -400.0

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.y = JUMP_VELOCITY
	animated_sprite_2d.play("jump")

func physics_update(_delta: float) -> void:
	finished.emit(FALLING)
