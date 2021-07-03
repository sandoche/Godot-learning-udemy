extends Area2D



func _on_SpikeTop_body_entered(body):
	get_tree().call_group("Gamestate", "hurt")


func _on_Area2D_body_entered(body):
	get_tree().call_group("Gamestate", "hurt")
