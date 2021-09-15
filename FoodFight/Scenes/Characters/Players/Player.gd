extends KinematicBody

const SPEED = 10
const UP = Vector3(0,1,0)

var motion = Vector3()
var movement_state = 0 # idle is 0, run is 1

const MIN_BLEND_SPEED = 0.125 # minimum movement threshold before we start the animation
const BLEND_TO_RUN = 0.075
const BLEND_TO_IDLE = 0.1

func _physics_process(delta):
	move()
	animate()
	
func move():
	var x = Input.get_action_strength("forward") - Input.get_action_strength("back")
	var z = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	motion = Vector3(x, 0, z)
	move_and_slide(motion * SPEED, UP)

	if not motion == Vector3(0,0,0):
		face_forward(x,z)
	
func face_forward(x,z):
	rotation.y = atan2(x,z) - PI * 2

func animate():
	if (motion * SPEED).length() > MIN_BLEND_SPEED:
		movement_state += BLEND_TO_RUN
	else:
		movement_state -= BLEND_TO_IDLE

	movement_state = clamp(movement_state, 0, 1)
	var animation = $Armature/AnimationTree
	
	animation["parameters/Move/blend_amount"] = movement_state

