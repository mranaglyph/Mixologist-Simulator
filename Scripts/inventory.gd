class_name Inventory
extends RefCounted

const air_mail = preload("res://Mixed/air_mail.tres")
const amaretto_sour = preload("res://Mixed/amaretto_sour.tres")
const americano = preload("res://Mixed/americano.tres")
const aperol_spritz = preload("res://Mixed/aperol_spritz.tres")
const aviation = preload("res://Mixed/aviation.tres")
const bees_knees = preload("res://Mixed/bees_knees.tres")
const bijou = preload("res://Mixed/bijou.tres")
const black_russian = preload("res://Mixed/black_russian.tres")
const bloody_mary = preload("res://Mixed/bloody_mary.tres")
const boulevardier = preload("res://Mixed/boulevardier.tres")
const bramble = preload("res://Mixed/bramble.tres")
const caipirinha = preload("res://Mixed/caipirinha.tres")
const corpse_reviver = preload("res://Mixed/corpse_reviver.tres")
const cosmopolitan = preload("res://Mixed/cosmopolitan.tres")
const daiquiri = preload("res://Mixed/daiquiri.tres")
const dark_and_stormy = preload("res://Mixed/dark_and_stormy.tres")
const dirty_martini = preload("res://Mixed/dirty_martini.tres")
const dry_martini = preload("res://Mixed/dry_martini.tres")
const espresso_martini = preload("res://Mixed/espresso_martini.tres")
const french_75 = preload("res://Mixed/french_75.tres")
const gimlet = preload("res://Mixed/gimlet.tres")
const gin_and_tonic = preload("res://Mixed/gin_and_tonic.tres")
const gin_basil_smash = preload("res://Mixed/gin_basil_smash.tres")
const gin_fizz = preload("res://Mixed/gin_fizz.tres")
const hanky_panky = preload("res://Mixed/hanky_panky.tres")
const income_tax = preload("res://Mixed/income_tax.tres")
const jungle_bird = preload("res://Mixed/jungle_bird.tres")
const last_word = preload("res://Mixed/last_word.tres")
const long_island_iced_tea = preload("res://Mixed/long_island_iced_tea.tres")
const mai_tai = preload("res://Mixed/mai_tai.tres")
const manhattan = preload("res://Mixed/manhattan.tres")
const margarita = preload("res://Mixed/margarita.tres")
const martinez = preload("res://Mixed/martinez.tres")
const mimosa = preload("res://Mixed/mimosa.tres")
const mint_julep = preload("res://Mixed/mint_julep.tres")
const mojito = preload("res://Mixed/mojito.tres")
const moscow_mule = preload("res://Mixed/moscow_mule.tres")
const naked_and_famous = preload("res://Mixed/naked_and_famous.tres")
const negroni = preload("res://Mixed/negroni.tres")
const old_cuban = preload("res://Mixed/old_cuban.tres")
const old_fashioned = preload("res://Mixed/old_fashioned.tres")
const painkiller = preload("res://Mixed/painkiller.tres")
const pina_colada = preload("res://Mixed/pina_colada.tres")
const pisco_sour = preload("res://Mixed/pisco_sour.tres")
const pornstar_martini = preload("res://Mixed/pornstar_martini.tres")
const sazerac = preload("res://Mixed/sazerac.tres")
const sidecar = preload("res://Mixed/sidecar.tres")
const southside = preload("res://Mixed/southside.tres")
const vesper = preload("res://Mixed/vesper.tres")
const vieux_carre = preload("res://Mixed/vieux_carre.tres")
const whiskey_sour = preload("res://Mixed/whiskey_sour.tres")
const white_russian = preload("res://Mixed/white_russian.tres")
const zombie = preload("res://Mixed/zombie.tres")

static var tres = [
	air_mail,
	amaretto_sour,
	americano,
	aperol_spritz,
	aviation,
	bees_knees,
	bijou,
	black_russian,
	bloody_mary,
	boulevardier,
	bramble,
	caipirinha,
	corpse_reviver,
	cosmopolitan,
	daiquiri,
	dark_and_stormy,
	dirty_martini,
	dry_martini,
	espresso_martini,
	french_75,
	gimlet,
	gin_and_tonic,
	gin_basil_smash,
	gin_fizz,
	hanky_panky,
	income_tax,
	jungle_bird,
	last_word,
	long_island_iced_tea,
	mai_tai,
	manhattan,
	margarita,
	martinez,
	mimosa,
	mint_julep,
	mojito,
	moscow_mule,
	naked_and_famous,
	negroni,
	old_cuban,
	old_fashioned,
	painkiller,
	pina_colada,
	pisco_sour,
	pornstar_martini,
	sazerac,
	sidecar,
	southside,
	vesper,
	vieux_carre,
	whiskey_sour,
	white_russian,
	zombie
]
static var inventory = []

static func load_inventory():
	for any_file in tres:
		var ingredient_name = any_file.ingredients
		for i in ingredient_name:
			inventory.append(i)
		
	var unq_inv = unique_inventory(inventory)
	return unq_inv
	
static func unique_inventory(inventory_name):
	var removed_duplicates = []
	for i in inventory_name:
		if i not in removed_duplicates:
			removed_duplicates.append(i)
			
	inventory_name.clear()
	
	for element in removed_duplicates:
		inventory_name.append(element)
		
	return inventory_name

static func list_inventory() -> String:
	if inventory.size() == 0:
		load_inventory()
		
	var msg = ""
	var index = 0
	while index < inventory.size():
		msg += "%d. %s\n" % [index + 1, inventory[index]]
		index += 1
		
	return msg
