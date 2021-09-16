extends KinematicBody

var food_types = {}

const PROJECTILE_SPEED = 50

func _ready():
	food_types = file_grabber.get_files("res://Projectiles/FoodTypes/")
	randomize()

func fire():
	var random_food = food_types[randi() % food_types.size()]
	var projectile = load(random_food).instance()
	add_child(projectile)
	projectile.set_as_toplevel(true)
	projectile.global_transform = $Forward.global_transform
	var character_forward = global_transform.basis[2].normalized()
	projectile.linear_velocity = character_forward * PROJECTILE_SPEED
