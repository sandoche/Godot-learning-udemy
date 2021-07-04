extends Node2D

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position
