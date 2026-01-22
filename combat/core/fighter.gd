class_name Fighter extends CharacterBody2D

@export var input_buffer : InputBuffer = null

const SPEED = 500.0
var facing_direction := -1

func _physics_process(delta: float) -> void:
	var command := input_buffer.get_command()
	if command != "":
		print(command)
		#state_machine.handle_command(command)
		input_buffer.consume()
