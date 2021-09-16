extends KinematicBody

const PROJECTILE_SPEED = 50

func fire():
	var projectile = load("res://Projectiles/ProjectileTemplate.tscn").instance()
	add_child(projectile)
	projectile.set_as_toplevel(true)
	projectile.global_transform = $Forward.global_transform
	var character_forward = global_transform.basis[2].normalized()
	projectile.linear_velocity = character_forward * PROJECTILE_SPEED
