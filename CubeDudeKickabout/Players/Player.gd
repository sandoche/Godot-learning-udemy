extends KinematicBody

var motion = Vector3()

export var player_id = 1

const SPEED = 10
const UP = Vector3(0, 1, 0)

func _physics_process(delta):
	move()
	animate()
	face_forward()

func move():
	var x = Input.get_action_strength("right_%s" % player_id) - Input.get_action_strength("left_%s" % player_id)
	var z = Input.get_action_strength("down_%s" % player_id) - Input.get_action_strength("up_%s" % player_id)
	motion = Vector3(x, 0, z)
	move_and_slide(motion.normalized() * SPEED, UP)

func animate():
	if motion.length() > 0:
		$AnimationPlayer.play("Arms Cross Walk")
	else:
		$AnimationPlayer.stop()

func face_forward():
	if not motion.x == 0 or motion.z == 0:
		look_at(Vector3(-motion.x, 0 , -motion.z)*SPEED, UP)
