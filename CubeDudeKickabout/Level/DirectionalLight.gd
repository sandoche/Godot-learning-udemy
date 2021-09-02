extends DirectionalLight

func _ready():
	reset()

func freeze(id):
	$AnimationPlayer.play("Fade")

func reset():
	light_energy = 1.1
