extends RigidBody

func _on_VisibilityNotifier_camera_exited(camera):
	queue_free()

func hurt():
	$AnimationPlayer.play("Die")
