class_name Parser
extends Node

@onready var image_gen_ref = %ImageGen
@onready var npc_image_ref = $"../BKGD/MarginContainer/HBox1/ImageDisplay/NPCGen"
@onready var npc_dialog_ref = npc_image_ref.get_node("NPCImage")
@onready var time_ref = %TimeLabel
@onready var main_ref = $".."

var tres_ref = Inventory.tres

var command_list = "get, drop, drop-all, holding, mix, serve, discard, help, inv, mixology, close, start"
var holding_list = []
var mixed_drink_held = ""
var holding_mixed_drink = false
var holding_ingredients = ""
var manual_open = false
var cust_helped = false

func _ready():
	global.drop_list = holding_list

func _process(_delta):
	global.drop_list = holding_list

func command(phrase: String):
	var word_param = ""
	var word_one
	var word_sep = phrase.split(" ", false)
	if word_sep.size() == 0:
		return "Error: Cannot Parse Empty Array"
	
	if word_sep[0] != "customer-request-bypass":
		for i in word_sep:
			var temp = i.to_lower()
			var index = word_sep.find(i)
			word_sep.remove_at(index)
			word_sep.insert(index, temp)
		
		if word_sep.size() > 1:
			word_one = word_sep[0]
			word_param = word_sep[1]
		else: 
			word_one = word_sep[0]
	else:
		word_one = word_sep[0]
		for i in range(1, word_sep.size()):
			var temp = word_sep[i].to_upper()
			word_param += temp + " "

	match (word_one):
		"controller-request-scoreboard":
			var scoreboard_scene = "res://Scenes/scoreboard.tscn"
			get_tree().change_scene_to_file(scoreboard_scene)
			return "Changed Scenes"
		
		"controller-request-scoreboard-final":
			var scoreboard_final = "res://Scenes/scoreboard_final.tscn"
			get_tree().change_scene_to_file(scoreboard_final)
			return "Changed Scenes"
		
		"customer-request-bypass":
			if !manual_open:
				return word_param
			else:
				return "Customer walked away..."
		
		"help":
			if !manual_open:
				return help()
			else: return "Close Mixology Manual first."
		
		"get":
			if !manual_open: 
				return get_item(word_param)
			else: return "Close Mixology Manual first."
		
		"drop":
			if !manual_open:
				return drop_item(word_param)
			else: return "Close Mixology Manual first."
			
		"drop-all":
			if !manual_open:
				return drop_all_items_held()
			else: return "Close Mixology Manual first."
			
		"holding":
			if !manual_open:
				return items_held()
			else: return "Close Mixology Manual first."
			
		"mix":
			if !manual_open:
				return mix_holding(word_param)
			else: return "Close Mixology Manual first."
			
		"serve":
			if !manual_open:
				return serve_customer()
			else: return "Close Mixology Manual first."
			
		"discard":
			if !manual_open:
				return discard_mixed_drink()
			else: return "Close Mixology Manual first."
			
		"inv":
			if !manual_open:
				return Inventory.list_inventory()
			else: return "Close Mixology Manual first."
			
		"mixology":
			if !manual_open:
				manual_open = true
				return display_manual()
			else: return "Close Mixology Manual first."
			
		"close":
			if manual_open:
				var info_header_ref = %InfoHeader
				manual_open = false
				info_header_ref.time_flag = true
				var vbox2_ref = %VBox2
				var vbox2_children = vbox2_ref.get_children()
				for i in vbox2_children:
					i.queue_free()
				return "Mixology Manual closed."
			else:
				return "The Mixology Manual is not open."
				
		"start":
			var info_header_ref = %InfoHeader
			if info_header_ref.night_start:
				return "The night has already begun!"
			else:
				info_header_ref.night_start = true
				info_header_ref.time_flag = true
				return "Started the night [%s]." % info_header_ref.night_name_var
			
		_:
			if !manual_open:
				return "Huh?"
			else: return "Close Mixology Manual first."

func get_item(word_param_entry: String) -> String:
	if holding_mixed_drink:
		return "You can't get anything with a mixed drink in your hands, chief."
	else:
		if word_param_entry == "":
			return "Get what, exactly?"
		else: 
			var img = image_gen_ref.generate_image(word_param_entry)
			if img != "empty" && img not in holding_list:
				image_gen_ref.generate_image(word_param_entry)
				holding_list.append(image_gen_ref.generate_image(word_param_entry))
				return "You're now holding %s" % word_param_entry
			elif img != "empty" && img in holding_list:
				return "You're already holding %s" % word_param_entry
			else:
				return "That's not a thing, chief."

func drop_item(word_param_entry: String) -> String:
	if !holding_mixed_drink:
		if word_param_entry == "":
			return "Drop what, exactly?"
		else: 
			var img = image_gen_ref.clear_image(word_param_entry)
			if img != "empty" && img in holding_list:
				image_gen_ref.clear_image(word_param_entry)
				
				for i in holding_list: if i == img: holding_list.erase(i)
				
				return "Dropped %s" % word_param_entry
				
			elif img != "empty" && img not in holding_list:
				return "You can't drop what you're not holding, chief."
			else:
				return "You can't drop what you're not holding, chief."
	else: return "You can't drop a mixed drink, but you can DISCARD it."

func help() -> String:
	return "\ncmds: " + str(command_list) + "\n\nYou can focus the text input with the 'Enter' key or the Mouse.\nInput is not case sensitive but IS format sensitive (beware dashes).\n'Inv' will show you the club's inventory.\n'Get' will let you grab anything from the club's inventory.\n'Drop' lets you drop a held item, but not a mixed drink.\n'Mix' will attempt to mix the ingredients you're holding.\n'Serve' and 'Discard' work with mixed drinks.\n'Mixology' will allow you to review how to make drinks.\nYou can hold any number of *unique* things at the same time.\nCheck what you're 'holding' with that word."

func items_held():
	if mixed_drink_held == "":
		var msg = "Holding: "
		var index = 0
		if holding_list.size() == 0 || holding_list.size() == null:
			msg = "You're not holding anything right now."
			return msg
		else:	
			while index < holding_list.size():
				if index + 1 != holding_list.size(): msg += holding_list[index] + ", "
				else: msg += holding_list[index]
				index += 1
				
			return msg
	else: return "You're holding a mixed drink [%s] right now." % mixed_drink_held

func mix_holding(word_param):
	match word_param:
		"old-fashioned":
			return mix_drink_process(Inventory.old_fashioned)
		"negroni":
			return mix_drink_process(Inventory.negroni)
		"bijou":
			return mix_drink_process(Inventory.bijou)
		"income-tax":
			return mix_drink_process(Inventory.income_tax)
		"whiskey-sour":
			return mix_drink_process(Inventory.whiskey_sour)
		"dry-martini":
			return mix_drink_process(Inventory.dry_martini)
		"margarita":
			return mix_drink_process(Inventory.margarita)
		"manhattan":
			return mix_drink_process(Inventory.manhattan)
		"moscow-mule":
			return mix_drink_process(Inventory.moscow_mule)
		"espresso-martini":
			return mix_drink_process(Inventory.espresso_martini)
		"dirty-martini":
			return mix_drink_process(Inventory.dirty_martini)
		"mojito":
			return mix_drink_process(Inventory.mojito)
		"mimosa":
			return mix_drink_process(Inventory.mimosa)
		"gimlet":
			return mix_drink_process(Inventory.gimlet)
		"sazerac":
			return mix_drink_process(Inventory.sazerac)
		"sidecar":
			return mix_drink_process(Inventory.sidecar)
		"mint-julep":
			return mix_drink_process(Inventory.mint_julep)
		"french-75":
			return mix_drink_process(Inventory.french_75)
		"daiquiri":
			return mix_drink_process(Inventory.daiquiri)
		"boulevardier":
			return mix_drink_process(Inventory.boulevardier)
		"cosmopolitan":
			return mix_drink_process(Inventory.cosmopolitan)
		"bee's-knees":
			return mix_drink_process(Inventory.bees_knees)
		"gin-and-tonic":
			return mix_drink_process(Inventory.gin_and_tonic)
		"martinez":
			return mix_drink_process(Inventory.martinez)
		"bloody-mary":
			return mix_drink_process(Inventory.bloody_mary)
		"mai-tai":
			return mix_drink_process(Inventory.mai_tai)
		"long-island-iced-tea":
			return mix_drink_process(Inventory.long_island_iced_tea)
		"air-mail":
			return mix_drink_process(Inventory.air_mail)
		"southside":
			return mix_drink_process(Inventory.southside)
		"hanky-panky":
			return mix_drink_process(Inventory.hanky_panky)
		"caipirinha":
			return mix_drink_process(Inventory.caipirinha)
		"old-cuban":
			return mix_drink_process(Inventory.old_cuban)
		"aviation":
			return mix_drink_process(Inventory.aviation)
		"bramble":
			return mix_drink_process(Inventory.bramble)
		"vieux-carre":
			return mix_drink_process(Inventory.vieux_carre)
		"painkiller":
			return mix_drink_process(Inventory.painkiller)
		"vesper":
			return mix_drink_process(Inventory.vesper)
		"n*ked-and-famous":
			return mix_drink_process(Inventory.naked_and_famous)
		"gin-basil-smash":
			return mix_drink_process(Inventory.gin_basil_smash)
		"p*rnstar-martini":
			return mix_drink_process(Inventory.pornstar_martini)
		"dark-and-stormy":
			return mix_drink_process(Inventory.dark_and_stormy)
		"zombie":
			return mix_drink_process(Inventory.zombie)
		"corpse-reviver":
			return mix_drink_process(Inventory.corpse_reviver)
		"pina-colada":
			return mix_drink_process(Inventory.pina_colada)
		"gin-fizz":
			return mix_drink_process(Inventory.gin_fizz)
		"jungle-bird":
			return mix_drink_process(Inventory.jungle_bird)
		"amaretto-sour":
			return mix_drink_process(Inventory.amaretto_sour)
		"americano":
			return mix_drink_process(Inventory.americano)
		"last-word":
			return mix_drink_process(Inventory.last_word)
		"pisco-sour":
			return mix_drink_process(Inventory.pisco_sour)
		"aperol-spritz":
			return mix_drink_process(Inventory.aperol_spritz)
		"white-russian":
			return mix_drink_process(Inventory.white_russian)
		"black-russian":
			return mix_drink_process(Inventory.black_russian)
		"custom":
			return mix_custom_process()
			
		
		_:
			return "YOU might be a bit mixed up."

func discard_mixed_drink():
	if holding_mixed_drink:
		holding_mixed_drink = false
		mixed_drink_held = ""
		holding_ingredients = ""
		holding_list.clear()
		image_gen_ref.clear_image("any")
		return "Discarded mixed drink."
	else: return "No mixed drink to discard."

func drop_all_items_held():
	if !holding_mixed_drink:
		holding_list.clear()
		image_gen_ref.clear_image("any")
		return "Dropped everything."
	else: return "You can't drop a mixed drink, but you can DISCARD it."

func display_manual():
	var msg = "\n            Mixology Manual\n--------------------------------------------------------------------------------------------------------\nType 'close' to close the manual.\nIf you are going to mix a drink, be sure to enter the name without spaces - use dashes instead. (ex: mix air-mail)\n\n"
	
	for i in range(Inventory.tres.size()):
		var ing = ""
		var index = 0
		while index < Inventory.tres[i].ingredients.size():
			if index + 1 == Inventory.tres[i].ingredients.size():
				ing += Inventory.tres[i].ingredients[index]
			else: ing += Inventory.tres[i].ingredients[index] + ", "
			index += 1
		
		msg += "            Name: %s\n%s\n\n" % [Inventory.tres[i].drink_name, ing]
	
	return msg

func mix_drink_process(drink_tres_ref) -> String:
	var msg
	if !holding_mixed_drink:
		var glass_ref
		
		match (drink_tres_ref.glass_type):
			"highball":
				glass_ref = "Highball Glass"
			"sour":
				glass_ref = "Sour Glass"
			"wine":
				glass_ref = "Wine Glass"
			"cocktail":
				glass_ref = "Cocktail Glass"
			"old-fashioned":
				glass_ref = "Old Fashioned Glass"
			"short-cocktail":
				glass_ref = "Short Cocktail Glass"
			"martini":
				glass_ref = "Martini Glass"
			"champagne-flute":
				glass_ref = "Champagne Flute Glass"
			"margarita":
				glass_ref = "Margarita Glass"
			"copper-mug":
				glass_ref = "Copper Mug"
			"coupe":
				glass_ref = "Coupe Glass"
			"hurricane":
				glass_ref = "Hurricane Glass"
			"poco-grande":
				glass_ref = "Poco Grande Glass"
			"champagne-coupe":
				glass_ref = "Champagne-Coupe Glass"
			"cobbler":
				glass_ref = "Cobbler Glass"
			"zombie":
				glass_ref = "Zombie Glass"
			"shot-glass":
				glass_ref = "Shot Glass"
			_:
				glass_ref = "Glass"
		
		if holding_list.size() != drink_tres_ref.ingredients.size():
			msg = "Not enough ingredients, chief."
			mixed_drink_held = ""
		else:
			var h_index = 0
			while h_index < holding_list.size():
				if h_index + 1 == holding_list.size(): 
					holding_ingredients += holding_list[h_index]
				else: 
					holding_ingredients += holding_list[h_index] + ", "
				h_index += 1
			
			image_gen_ref.generate_image_glass(drink_tres_ref.glass_type)
			msg = "Mixed up an %s in an %s!" % [drink_tres_ref.drink_name, glass_ref]
			mixed_drink_held = "%s" % drink_tres_ref.drink_name
			
			for i in holding_list:
				if i not in drink_tres_ref.ingredients:
					msg = "Mixed up a custom drink in a glass!\n(%s)" % holding_ingredients
					mixed_drink_held = "custom (%s)" % holding_ingredients
			
			holding_ingredients = ""
			holding_mixed_drink = true
			holding_list.clear()
		
		return msg
	else:
		return "Can't mix a new drink when you're holding one already, bucko."

func mix_custom_process():
	if !holding_mixed_drink:
		var msg
		
		if holding_list.size() <= 1:
			msg = "Not enough things to mix, chief."
			mixed_drink_held = ""
		else:
			var h_index = 0
			while h_index < holding_list.size():
				if h_index + 1 == holding_list.size(): holding_ingredients += holding_list[h_index]
				else: holding_ingredients += holding_list[h_index] + ", "
				h_index += 1
			
			msg = "Mixed up a custom drink in a glass!\n(%s)" % holding_ingredients
			mixed_drink_held = "custom (%s)" % holding_ingredients
			holding_mixed_drink = true
			holding_list.clear()
		
		return msg
	else:
		return "Can't mix a new drink when you're holding one already, bucko."

func serve_customer():
	var info_header_ref = %InfoHeader
	if info_header_ref.cust_waiting && info_header_ref.time_flag && info_header_ref.night_start:
		cust_helped = true
		var cust_request_raw = npc_dialog_ref.drink
		var cust_request_raw_list = cust_request_raw.split(" ", false)
		var cust_request = ""
		for i in range(cust_request_raw_list.size()):
			if i + 1 != cust_request_raw_list.size():
				cust_request += cust_request_raw_list[i].to_lower() + "-"
			else: 
				cust_request += cust_request_raw_list[i].to_lower()
		
		if holding_mixed_drink:
			if mixed_drink_held == cust_request_raw:
				global.cust_helped += 1
				mixed_drink_held = ""
				holding_mixed_drink = false
				npc_dialog_ref.texture = null
				image_gen_ref.clear_image("any")
				global.drinks_made.append(cust_request_raw)
				return "The customer took the %s." % cust_request_raw
			else:
				var mix_drink_txt = mixed_drink_held
				global.cust_helped += .5
				mixed_drink_held = ""
				holding_mixed_drink = false
				npc_dialog_ref.texture = null
				image_gen_ref.clear_image("any")
				global.drinks_made.append(mix_drink_txt)
				return "You gave the customer a %s, which they didn't ask for..." % mix_drink_txt
		else:
			if cust_request in holding_list:
				global.cust_helped += 1
				holding_list.erase(cust_request)
				npc_dialog_ref.texture = null
				image_gen_ref.clear_image("any")
				global.drinks_made.append(cust_request_raw)
				return "The customer took the %s." % cust_request_raw
			else:
				return "You're not holding a %s." % cust_request_raw
	else:
		return "There is nobody to serve this drink to."
