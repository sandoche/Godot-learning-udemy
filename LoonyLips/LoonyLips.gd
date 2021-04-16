extends Control

var player_words = []
var story = "Once upon a time %s watched %s and thought it was the %s movie since %s"
var prompts = ["Yann", "minion", "greatest", "1999"]

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	var finalText = story % prompts
	DisplayText.text = finalText

# 	Could also be replaced by this:
#	var label = get_node("DisplayText")
#	label.text = story % prompts


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)

func _on_TextureButton_pressed():
	update_DisplayText(PlayerText.text)	

func update_DisplayText(new_text):
	DisplayText.text = new_text
	PlayerText.clear()

