extends Node2D

func _ready():
	yield(get_tree(), "idle_frame") # to wait until nodes appears
	update_pointer_position(0)

func update_pointer_position(objective_number):
	var pointer = $ObjectivePointer
	var place = $ObjectivePositions.get_child(objective_number)
	var message = $ObjectiveMessages.get_child(objective_number)
	
	$Tween.interpolate_property(pointer, "position", pointer.position, place.position, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()
	$MessageSound.play()
	$TutorialGui/Control/NinePatchRect/Label.text = message.message

func _on_MoveObjective_body_entered(body):
	update_pointer_position(1)


func _on_DoorObjective_body_entered(body):
	update_pointer_position(2)


func _on_NightvisionObjective_body_entered(body):
	update_pointer_position(3)


func _on_BriefcaseObjective_body_entered(body):
	update_pointer_position(4)
