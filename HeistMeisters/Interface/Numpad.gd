extends Popup

var combination = [0,5,4,1]
var guess = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light =  $VBoxContainer/ButtonContainer/GridContainer/StatusLight

signal combination_correct

