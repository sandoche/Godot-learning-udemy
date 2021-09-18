extends CanvasLayer

func refresh_AmmoCount(ammo_count):
	$Refill/CenterContainer/AmmoCount.text = str(ammo_count)

func Refill(amount):
	$Refill.value = amount

func update_Lives(lives):
	var heart = preload("res://gfx/heart.png")
	$Lives.clear()
	for i in lives:
		$Lives.add_icon_item(heart, false)
	
