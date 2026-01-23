class_name WeaponData
extends Resource

@export var id := "fists"
@export var display_name := "Poings"
@export var description := "Combat à mains nues. Rapide, équilibré, sans artifices."

@export var move_map := {
	"LIGHT": preload("res://combat/moves/fists_light.tres"),
	"HEAVY": preload("res://combat/moves/fists_heavy.tres"),
	"SPECIAL": preload("res://combat/moves/fists_uppercut.tres"),
}

@export var passive_modifiers := []
