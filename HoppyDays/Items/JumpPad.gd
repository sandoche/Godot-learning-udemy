extends Area2D



func _on_JumpPad_body_entered(body):
	$AnimationPlayer.play("boost")
	body.boost()
