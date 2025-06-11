extends Button

func _on_pressed():
	reset_new_night()

func reset_new_night():
	global.drink_timer = 0
	global.drinks_made = []
	global.cust_helped = 0
	
	var night_ref = Nights.night()
	match (night_ref):
		"Tuesday":
			Nights.tonight = Nights.worknight.Wednesday
		"Wednesday":
			Nights.tonight = Nights.worknight.Thursday
		"Thursday":
			Nights.tonight = Nights.worknight.Friday
		"Friday":
			Nights.tonight = Nights.worknight.Saturday
		"Saturday":
			Nights.tonight = Nights.worknight.Tuesday
	
	var main_scene = "res://Scenes/main.tscn"
	get_tree().change_scene_to_file(main_scene)
