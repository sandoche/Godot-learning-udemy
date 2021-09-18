extends "res://Scenes/Characters/Character.gd"

var Player = preload("res://Scenes/Characters/Players/Player.gd")

func _process(delta):
	if $RayCast.is_colliding():
		var body = $RayCast.get_collider()
		if body is Player:
			try_to_fire()
