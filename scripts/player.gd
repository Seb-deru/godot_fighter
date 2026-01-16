class_name Player extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var is_punching := false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if !animated_sprite_2d.is_playing():
		is_punching = false

	if Input.is_action_just_pressed("hit"):
		is_punching = true
		animated_sprite_2d.play("punch")

	# Handle jump.
	if  Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")
		
	move_and_slide()
