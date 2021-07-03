extends Node2D

func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("die")
	$AudioStreamPlayer.play()
	get_tree().call_group("Gamestate", "coin_up")

func die():
	queue_free()

