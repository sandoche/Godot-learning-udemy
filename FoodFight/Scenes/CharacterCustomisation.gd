extends Spatial

var material_list = {}
var current_material = 0
var current_player
var selected_material # the material we are passing to customisation.gd

func _ready():
	get_tree().paused = false
	material_list = file_grabber.get_files("res://Scenes/Customisation/PlayerMaterials/")
	current_player = "Female"
	selected_material = load(material_list[current_material])
	$ArmatureM.hide()

func _on_CharacterSelect_item_selected(index):
	$ArmatureM.hide()
	$ArmatureF.hide()
	
	match index:
		0:
			current_player = "Female"
			$ArmatureF.show()
		1:
			current_player = "Male"
			$ArmatureM.show()

func _on_LeftButton_pressed():
	change_material("Left")


func _on_RightButton_pressed():
	change_material("Right")

func change_material(direction):
	var materials_last_index = material_list.size()
	
	if direction == "Right":
		current_material += 1
	else:
		current_material -= 1
	
	current_material = current_material % materials_last_index
	
	var Male = $ArmatureM/Mesh
	var Female = $ArmatureF/Mesh
	
	selected_material = load(material_list[current_material])
	
	Male.set_surface_material(0, selected_material)
	Female.set_surface_material(0, selected_material)
	

func _on_StartButton_pressed():
	customisation.Player_material = selected_material
	customisation.Player_character = current_player
	get_tree().change_scene("res://Level/Level1.tscn")
