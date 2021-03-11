extends Control

func _ready():
	var prompts = ["Yann", "minion", "greatest", "1999"]
	var story = "Once upon a time %s watched %s and thought it was the %s movie since %s"
	print(story % prompts)

	prompts = ["John", "tenet", "worst", "1800"]
	print(story % prompts)
