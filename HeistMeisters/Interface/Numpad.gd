extends Popup

var combination = [0,5,4,1]
var guess = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light =  $VBoxContainer/ButtonContainer/GridContainer/StatusLight

signal combination_correct

func _ready():
	connect_buttons()
	reset_lock()

func connect_buttons():
	for child in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "Button_pressed", [child.text])

func Button_pressed(value):
	if value == "OK":
		check_guess()
	else:
		enter(int(value))

func check_guess():
	if guess == combination:
		emit_signal("combination_correct")
	else:
		reset_lock()
		
func enter(value):
	guess.append(value)
	update_display()
	if guess.size() == combination.size():
		check_guess()
	
func update_display():
	display.text = PoolStringArray(guess).join("")

func reset_lock():
	display.text = ""
	guess.clear()
