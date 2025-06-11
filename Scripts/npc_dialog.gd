extends Node

const single_item_list = [
	"Whiskey", 
	"Bourbon",
	"Vodka",
	"Gin",
	"Rum",
	"Tequila",
	"Brandy",
	"Espresso",
	"Dry Wine",
	"Sweet Wine",
	"Sparkling Wine",
	"Beer",
	"Orange Juice",
	"Pineapple Juice",
	"Cranberry Juice",
	"Bottled Water",
	"Tonic Water",
	"Sparkling Water",
	"Coconut Water", 
	"Coconut Milk",
	"Soda Pop"
]

const intros = [
	"Customer: I'd like",
	"Customer: Gimme a",
	"Customer: If you got it, I'd like",
	"Customer: Please give me a",
	"Customer: I'll get a"
]

const outros = [
	"please.",
	"right away.",
	"ASAP.",
	"thanks.",
	"thank you."
]

var intro
var drink
var outro

func _process(_delta):
	if self.texture == null:
		$"../NPCEmotion".visible = false
	else: $"../NPCEmotion".visible = true

func drink_selection_and_dialog():
	var singular_or_mixed = WR.weighted_random(["single", "mixed", "custom"], [.10, .90, 0.0], 100)[0]
	match (singular_or_mixed):
		"single":
			intro = dialog_intro()
			drink = select_single_item()
			outro = dialog_outro()
			return "%s %s %s" % [intro, drink, outro]
		"mixed":
			intro = dialog_intro()
			drink = select_mixed_drink()
			outro = dialog_outro()
			return "%s %s %s" % [intro, drink, outro]
		#"custom":
			#intro = dialog_intro()
			#drink = select_custom_drink()
			#outro = dialog_outro()
			#return "%s %s %s" % [intro, drink, outro]
			
func select_single_item():
	var random_index = randi_range(0, single_item_list.size() - 1)
	return single_item_list[random_index]
	
func select_mixed_drink():
	var random_index = randi_range(0, Inventory.tres.size() - 1)
	return Inventory.tres[random_index].drink_name

#func select_custom_drink():
	#var random_index = randi_range(0, Inventory.tres.size() - 1)
	#
	#var mixed_drink_name = Inventory.tres[random_index].drink_name
	#var mixed_drink_ing  = Inventory.tres[random_index].ingredients
	#
	#var remove_add_substitute = WR.weighted_random(["remove", "add", "substitute"], [.33, .33, .34], 100)
	#match (remove_add_substitute):
		#"remove":
			#var random_index_2 = randi_range(0, mixed_drink_ing.size() - 1)
			#mixed_drink_ing.remove_at(random_index_2)
			#
			#var mix_drink_txt = ""
			#for i in mixed_drink_ing:
				#mix_drink_txt += i
			#return mix_drink_txt
		#
		#"add":
			#var random_index_2 = randi_range(0, single_item_list.size() - 1)
			#mixed_drink_ing.append(single_item_list[random_index_2])
			#
			#var mix_drink_txt = ""
			#for i in mixed_drink_ing:
				#mix_drink_txt += i
			#return mix_drink_txt
		#
		#"substitute":
			#var random_index_2 = randi_range(0, mixed_drink_ing.size() - 1)
			#mixed_drink_ing.remove_at(random_index_2)
			#
			#var random_index_3 = randi_range(0, single_item_list.size() - 1)
			#mixed_drink_ing.append(single_item_list[random_index_2])
			#
			#var mix_drink_txt = ""
			#for i in mixed_drink_ing:
				#mix_drink_txt += i
			#return mix_drink_txt

func dialog_intro():
	var random_index = randi_range(0, intros.size() - 1)
	return intros[random_index]
	
func dialog_outro():
	var random_index = randi_range(0, outros.size() - 1)
	return outros[random_index]
