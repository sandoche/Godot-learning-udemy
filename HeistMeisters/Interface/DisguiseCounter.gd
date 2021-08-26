extends ItemList

func update_disguises(number):
	clear()
	for diguises in range(number):
		add_icon_item(load("res://GFX/PNG/Tiles/tile_129.png"), false)
