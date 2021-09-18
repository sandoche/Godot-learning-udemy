extends Area

func _on_RefillArea_body_entered(body):
	if body.has_method("RefillArea_entered"):
		body.RefillArea_entered()


func _on_RefillArea_body_exited(body):
	if body.has_method("RefillArea_exited"):
		body.RefillArea_exited()
