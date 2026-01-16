extends PlayerState

@export var animated_sprite_2d: AnimatedSprite2D

func enter(previous_state_path: String, data := {}) -> void:
	player.velocity = Vector2(0, 0)
	animated_sprite_2d.play("iddle")

func physics_update(_delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	
	if direction:
		finished.emit(RUNNING)
