extends Spatial

export var max_wait = 5

const SPEED = 10

var bystanders = {}

func _ready():
	bystanders = file_grabber.get_files("res://Bystanders/BystandersFigures/")
	randomize()
	set_timer()

func set_timer():
	$Timer.wait_time = randi() % max_wait + 1

func _on_Timer_timeout():
	set_timer()
	spawn()
	
func spawn():
	var bystander = load(bystanders[randi() % bystanders.size()]).instance()
	add_child(bystander)
	bystander.set_as_toplevel(true)
	bystander.global_transform = $Forward.global_transform
	
	var spawn_forward = global_transform.basis[2].normalized()
	bystander.linear_velocity = spawn_forward * SPEED
