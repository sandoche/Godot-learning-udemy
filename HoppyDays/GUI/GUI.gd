extends CanvasLayer

func update_lives(lives_left):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)
