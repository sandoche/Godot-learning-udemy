extends RigidBody

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	queue_free()

func _on_ProjectileTemplate_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.has_method("hurt"):
		body.hurt()

