extends "res://Scenes/Characters/Character.gd"

var Player = preload("res://Scenes/Characters/Players/Player.gd")

func _ready():
	character_type = CHARACTER_TYPES.npc

func _process(delta):
	if $RayCast.is_colliding():
		try_to_fire()
