extends Spatial

var ennemy_count

func _ready():
	ennemy_count = $Robots.get_child_count()

func remove_ennemy():
	ennemy_count -= 1
	if ennemy_count < 1:
		get_tree().change_scene("res://GUI/Victory.tscn")


