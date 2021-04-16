extends Control

var player_words = []

var templates = [{
			"prompts": ["a name", "a noun", "an adverb", "an adjective"],
			"story": "Once upon a time someone called %s ate a %s flavoured sandwich which made him feel all %s inside. It was a %s day"
		},
		{
			"prompts": ["a name", "a object", "another object"],
			"story": "Once upon a time %s was trying to build a %s but built instead a %s"
		},
		{
			"prompts": ["an animal", "a food", "an object", "a noun"],
			"story": "There was a %s that was trying to cook a %s but he accidentally dropped %s on it and it tasted like %s"
		}]

var current_story

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
# Could also be replaced by this:
# onready var DisplayText = get_node("DisplayText")

func _ready():
	set_current_story()
	DisplayText.text = "Welcome to loony lips! We are going to tell a story and have a wonderful time, "
	check_player_words_length()
	PlayerText.grab_focus()

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func set_current_story():
	randomize()
	current_story = templates[randi() % templates.size()]

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()
	

func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ''
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = current_story.story % player_words
	
func prompt_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"

func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = 'Again!'
	tell_story()
