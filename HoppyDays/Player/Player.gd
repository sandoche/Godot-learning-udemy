extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1500
const GRAVITY = 150
const UP = Vector2(0,-1)
const JUMP_SPEED = 3500
const WORLD_LIMIT = 4000

var lives = 3

signal animate

func _physics_process(delta):
	# every frame apply the following
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if position.y > WORLD_LIMIT:
		end_game()
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

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
	emit_signal("animate", motion)

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	
func hurt():
	position.y -=1
	yield(get_tree(), "idle_frame") # to wait a frame
	motion.y -= JUMP_SPEED
	lives -= 1
	
	if lives < 0:
		end_game()
