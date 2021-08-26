extends Control

func _on_StartButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
