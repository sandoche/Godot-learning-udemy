extends Spatial

func _on_GoalDetector_body_entered(body, goal_id):
	if goal_id == 1:
		print('Player 1 has scored')
	else:
		print('Player 2 has scored')
