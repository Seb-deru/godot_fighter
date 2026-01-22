class_name PlayerState extends State

const IDLE := "Idle"
const RUNNING := "Running"
const JUMPING := "Jumping"
const FALLING := "Falling"
const ATTACK: = "Attack"

var player: Fighter

@export var animated_player: AnimationPlayer
@export var sprite_2d: Sprite2D

func _ready() -> void:
	await owner.ready
	player = owner as Fighter
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")

func move_player() -> void:
	face_player_direction()
	player.move_and_slide()

func player_direction() -> float:
	return Input.get_axis("left", "right")

func face_player_direction() -> void:
	var direction := player_direction()
	
	if direction != 0:
		var new_facing = direction
		if new_facing != player.facing_direction:
			player.facing_direction = new_facing
			player.rotate(PI)
			player.scale.y = abs(player.scale.y) * -new_facing

func apply_gravity(delta: float) -> void:
	var input_direction_x := player_direction()
	player.velocity.x = player.SPEED * input_direction_x
	player.velocity.y += player.get_gravity().y * delta
