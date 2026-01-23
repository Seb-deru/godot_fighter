class_name MoveData
extends Resource

@export var id := "fists_light"
@export var display_name := "Jab"

@export var animation := "jab"
@export var startup := 4
@export var active := 3
@export var recovery := 7

@export var damage := 5
@export var hitstun := 10
@export var blockstun := 6

@export var cancel_options := ["fists_light", "fists_heavy", "fists_uppercut"]
@export var interruptible_on_hit := true
@export var interruptible_on_block := false
