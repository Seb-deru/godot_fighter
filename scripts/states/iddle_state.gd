extends State

@export var animated_sprite_2d: AnimatedSprite2D

func enter(previous_state_path: String, data := {}) -> void:
	animated_sprite_2d.play("iddle")
