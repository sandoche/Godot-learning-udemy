extends SpotLight

const UP = Vector3(0, 1, 0)

func _ready():
	hide()
	
func freeze(player):
	var Player1 = get_tree().get_root().find_node("Player1", true, false)
	var Player2 = get_tree().get_root().find_node("Player2", true, false)
	
	var target
	
	if player == 1:
		target = Player1.translation
	else:
		target = Player2.translation
	
	look_at(target, UP)
	show()

func reset():
	hide()
