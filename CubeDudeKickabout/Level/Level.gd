extends Spatial

var Player1_score = 0
var Player2_score = 0

func _on_GoalDetector_body_entered(body, goal_id):
	get_tree().call_group("game_pieces", "freeze")
	$Timer.start()
	update_score(goal_id)

func _on_Timer_timeout():
	get_tree().call_group("game_pieces", "reset")

func update_score(player):
	var new_score
	
	match player:
		1: 
			Player1_score += 1
			new_score = Player1_score
		2:
			Player2_score += 1
			new_score = Player2_score
			
	$GUI.update_score(player, new_score)

