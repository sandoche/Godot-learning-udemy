extends KinematicBody

const SPEED = 10
const UP = Vector3(0,1,0)

var motion = Vector3()

func _physics_process(delta):
	move()
	
func move():
	var x = Input.get_action_strength("forward") - Input.get_action_strength("back")
	var z = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	motion = Vector3(x, 0, z)
	move_and_slide(motion * SPEED, UP)

	if not motion == Vector3(0,0,0):
		face_forward(x,z)
	
func face_forward(x,z):
	rotation.y = atan2(x,z) - PI/2
