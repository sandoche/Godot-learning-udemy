extends Control

var player_words = []

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
	# Json file used instead of the StoryBook node
	var stories = get_from_json("storybook.json")
	randomize()
	current_story = stories[randi() % stories.size()]

func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data

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
