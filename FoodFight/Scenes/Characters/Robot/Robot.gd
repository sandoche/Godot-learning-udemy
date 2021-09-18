extends "res://Scenes/Characters/Character.gd"

var Player = preload("res://Scenes/Characters/Players/Player.gd")

func _ready():
	character_type = CHARACTER_TYPES.npc

func _process(delta):
	if $RayCast.is_colliding():
		try_to_fire()

func update_lives():
	if lives > 0:
		var life = $Lives.get_child(0).get_child(0)
		life.play("loose_life")
	
