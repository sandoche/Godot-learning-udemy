extends Spatial

var ennemy_count

func _ready():
	instace_player_character()
	count_ennemies()

func instace_player_character():
	var Player
	if customisation.Player_character == "Male":
		Player = customisation.male.instance()
	else:
		Player = customisation.female.instance()
	add_child(Player)
	Player.transform = $PlayerStartPosition.transform
	
func count_ennemies():
	ennemy_count = $Robots.get_child_count()

func remove_ennemy():
	ennemy_count -= 1
	if ennemy_count < 1:
		get_tree().change_scene("res://GUI/Victory.tscn")


