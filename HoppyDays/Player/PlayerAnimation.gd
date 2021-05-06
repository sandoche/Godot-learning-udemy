extends AnimatedSprite

func _on_Player_animate(motion):
	if motion.y < 0:
		play("jump") # equals to self.play("jump")
	elif motion.x > 0:
		set_flip_h(false)
		play("walk")
	elif motion.x < 0:
		set_flip_h(true)
		play("walk")
	else:
		play("idle")
