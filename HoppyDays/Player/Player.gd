extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1000
const GRAVITY = 300
const UP = Vector2(0,-1)
const JUMP_SPEED = 3000

func _physics_process(delta):
	# every frame apply the following
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		
func move():
	if Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and !Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
	
func animate():
	if motion.y < 0:
		$AnimatedSprite.play("jump")
	elif motion.x > 0:
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.play("walk")
	elif motion.x < 0:
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("idle")

