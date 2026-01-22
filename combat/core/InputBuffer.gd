class_name InputBuffer
extends Node

# === CONFIGURATION ===
@export var buffer_size := 15              # frames conservées
@export var motion_leniency := 6            # tolérance directions
@export var button_leniency := 5            # tolérance boutons

# === STRUCTURE D'UNE FRAME ===
class InputFrame:
	var dir: Vector2
	var buttons := {}

	func _init(_dir: Vector2, _buttons: Dictionary):
		dir = _dir
		buttons = _buttons

# === BUFFER ===
var buffer: Array[InputFrame] = []

# === UPDATE ===
func _physics_process(_delta):
	_record_frame()

# === CAPTURE INPUT ===
func _record_frame():
	var dir := Vector2(
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down")
		- Input.get_action_strength("move_up")
	).round()

	var buttons := {
		"LIGHT": Input.is_action_just_pressed("attack_light"),
		"HEAVY": Input.is_action_just_pressed("attack_heavy"),
		"SPECIAL": Input.is_action_just_pressed("attack_special")
	}

	buffer.push_front(InputFrame.new(dir, buttons))

	if buffer.size() > buffer_size:
		buffer.pop_back()

# =========================================================
# === PUBLIC API ==========================================
# =========================================================

func get_command() -> String:
	if _match_special():
		return "SPECIAL"
	if _match_button("HEAVY"):
		return "HEAVY"
	if _match_button("LIGHT"):
		return "LIGHT"
	return ""

func consume():
	buffer.clear()

# =========================================================
# === MATCHING ============================================
# =========================================================

func _match_button(button: String) -> bool:
	for i in range(min(button_leniency, buffer.size())):
		if buffer[i].buttons.get(button, false):
			return true
	return false

# ↓ ↘ → + bouton
func _match_special() -> bool:
	if not _match_button("SPECIAL"):
		return false
	return _match_motion([
		Vector2(0, 1),
		Vector2(1, 1),
		Vector2(1, 0)
	])

func _match_motion(pattern: Array[Vector2]) -> bool:
	var index := 0

	for frame in buffer:
		if frame.dir == pattern[index]:
			index += 1
			if index >= pattern.size():
				return true
		elif frame.dir != Vector2.ZERO:
			# mauvaise direction → reset partiel
			index = 0

		if index > motion_leniency:
			break

	return false
