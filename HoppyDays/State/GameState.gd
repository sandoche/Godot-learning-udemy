extends Node2D

var lives = 3

func _ready():
	add_to_group("Gamestate")

func hurt():
	lives -= 1
	$Player.hurt()
	if lives < 0:
		end_game()

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
