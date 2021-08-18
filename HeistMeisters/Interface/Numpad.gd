extends Popup

var combination = [0,5,4,1]
var guess = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light =  $VBoxContainer/ButtonContainer/GridContainer/StatusLight

signal combination_correct

const FAIL_LIGHT = "res://GFX/Interface/PNG/dotRed.png"
const SUCCESS_LIGHT = "res://GFX/Interface/PNG/dotGreen.png"

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
		$AudioStreamPlayer.stream = load("res://SFX/threeTone1.ogg")
		$AudioStreamPlayer.play()
		light.texture = load(SUCCESS_LIGHT)
		$Timer.start()
	else:
		reset_lock()
		
func enter(value):
	$AudioStreamPlayer.stream = load("res://SFX/twoTone1.ogg")
	$AudioStreamPlayer.play()
	guess.append(value)
	update_display()
	if guess.size() == combination.size():
		check_guess()
	
func update_display():
	display.text = PoolStringArray(guess).join("")

func reset_lock():
	display.text = ""
	guess.clear()
	light.texture = load(FAIL_LIGHT)


func _on_Timer_timeout():
	emit_signal("combination_correct")
	reset_lock()
