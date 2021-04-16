extends Control

var player_words = []
var story = "Once upon a time %s watched %s and thought it was the %s movie since %s"
var prompts = ["a name", "a noun", "an adverb", "an adjective"]

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
# Could also be replaced by this:
# onready var DisplayText = get_node("DisplayText")

func _ready():
	prompt_player()

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()
	check_player_words_length()

func _on_TextureButton_pressed():
	add_to_player_words()
	check_player_words_length()

func add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()

func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = story % player_words
	
func prompt_player():
	DisplayText.text = "May I have " + prompts[player_words.size()] + " please?"

