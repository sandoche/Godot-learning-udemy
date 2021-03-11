extends Control

func _ready():
	var prompts = ["Yann", "minion", "greatest", "1999"]
	var story = "Once upon a time %s watched %s and thought it was the %s movie since %s"
	var finalText = story % prompts

	$DisplayText.text = finalText

# 	Could also be replaced by this:
#	var label = get_node("DisplayText")
#	label.text = story % prompts
