extends Spatial

var material_list = {}
var current_material = 0
var current_player

func _ready():
	material_list = file_grabber.get_files("res://Scenes/Customisation/PlayerMaterials/")
	current_player = "Female"
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
	
	Male.set_surface_material(0, load(material_list[current_material]))
	Female.set_surface_material(0, load(material_list[current_material]))
	

func _on_StartButton_pressed():
	get_tree().change_scene("res://Level/Level1.tscn")
