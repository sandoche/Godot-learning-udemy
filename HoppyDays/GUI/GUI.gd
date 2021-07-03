extends CanvasLayer

func update_lives(lives_left):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)

func update_coins(coins):
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
