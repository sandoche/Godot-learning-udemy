extends KinematicBody

enum CHARACTER_TYPES { player, npc }

var character_type

var food_types = {}

var can_fire = true
var lives = 3

const PROJECTILE_SPEED = 50

func _ready():
	food_types = file_grabber.get_files("res://Projectiles/FoodTypes/")
	randomize()
	
func try_to_fire():
	if can_fire:
		fire()
		can_fire = false
		$Timer.start()

func fire():
	var random_food = food_types[randi() % food_types.size()]
	var projectile = load(random_food).instance()
	add_child(projectile)
	projectile.fired_by = character_type
	projectile.set_as_toplevel(true)
	projectile.global_transform = $Forward.global_transform
	var character_forward = global_transform.basis[2].normalized()
	projectile.linear_velocity = character_forward * PROJECTILE_SPEED
	
func _on_Timer_timeout():
	can_fire = true

func hurt(hurt_by):
	if character_type != hurt_by:
		lives -= 1
		$HurtSfx.play()
		check_lives()
	
func check_lives():
	if lives < 1:
		die()
		
func die():
	queue_free()

