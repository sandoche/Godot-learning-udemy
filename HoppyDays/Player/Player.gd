extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1000

func _physics_process(delta):
	if Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and !Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
	
	move_and_slide(motion)
