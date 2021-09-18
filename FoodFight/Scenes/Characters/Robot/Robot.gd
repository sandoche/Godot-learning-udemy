extends "res://Scenes/Characters/Character.gd"

signal remove_ennemy

func _ready():
	character_type = CHARACTER_TYPES.npc
	var gamestate = get_parent().get_parent()
	connect("remove_ennemy", gamestate, "remove_ennemy")

func _process(delta):
	if $RayCast.is_colliding():
		try_to_fire()

func update_lives():
	if lives > 0:
		var life = $Lives.get_child(0).get_child(0)
		life.play("loose_life")
	
func die():
	emit_signal("remove_ennemy")
	queue_free()
