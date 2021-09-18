extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Level/Level1.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
