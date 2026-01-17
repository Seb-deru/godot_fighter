class_name Player extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 500.0

var is_punching := false

func _physics_process(delta: float) -> void:
	if !animated_sprite_2d.is_playing():
		is_punching = false

	if Input.is_action_just_pressed("hit"):
		is_punching = true
		animated_sprite_2d.play("punch")
