extends Node2D

#Inventory Image Scales
var img_scale

const img_scale_beer = Vector2(.15, .15)
const img_scale_bitters = Vector2(.15, .15)
const img_scale_fruit = Vector2(.2, .2)
const img_scale_juice = Vector2(.25, .25)
const img_scale_liqueurs = Vector2(.3, .3)
const img_scale_liquor = Vector2(.15, .15)
const img_scale_misc = Vector2(.2, .2)
const img_scale_syrup = Vector2(.25, .25)
const img_scale_water = Vector2(.2, .2)
const img_scale_wine = Vector2(.15, .15)

#Inventory Image Paths
const beer = "res://Assets/pngs/beer/beer.png"

const bitters_floral = "res://Assets/pngs/bitters/bitters_floral.png"
const bitters_fruit = "res://Assets/pngs/bitters/bitters_fruit.png"
const bitters_herbal = "res://Assets/pngs/bitters/bitters_herbal.png"
const bitters_spicy = "res://Assets/pngs/bitters/bitters_spicy.png"
const bitters_vegetable = "res://Assets/pngs/bitters/bitters_vegetable.png"

const fruit_cherry = "res://Assets/pngs/fruit/cherry.png"
const fruit_lemon = "res://Assets/pngs/fruit/lemon.png"
const fruit_lime = "res://Assets/pngs/fruit/lime.png"
const fruit_olive = "res://Assets/pngs/fruit/olive.png"
const fruit_orange = "res://Assets/pngs/fruit/orange.png"
const fruit_passion = "res://Assets/pngs/fruit/passion_fruit.png"
const fruit_pineapple = "res://Assets/pngs/fruit/pineapple.png"

const juice_cranberry = "res://Assets/pngs/juice/cranberry_juice.png"
const juice_lemon = "res://Assets/pngs/juice/lemon_juice.png"
const juice_lime = "res://Assets/pngs/juice/lime_juice.png"
const brine_olive = "res://Assets/pngs/juice/olive_brine.png"
const juice_orange = "res://Assets/pngs/juice/orange_juice.png"
const juice_pineapple = "res://Assets/pngs/juice/pineapple_juice.png"
const juice_tomato = "res://Assets/pngs/juice/tomato_juice.png"

const misc_basil_leaves = "res://Assets/pngs/misc/basil_leaves.png"
const misc_coconut_milk = "res://Assets/pngs/misc/coconut_milk.png"
const misc_cream = "res://Assets/pngs/misc/cream.png"
const misc_espresso = "res://Assets/pngs/misc/espresso.png"
const misc_honey = "res://Assets/pngs/misc/honey.png"
const misc_mint_leaves = "res://Assets/pngs/misc/mint_leaves.png"
const misc_nutmeg = "res://Assets/pngs/misc/nutmeg.png"
const misc_soda_pop = "res://Assets/pngs/misc/soda_pop.png"
const misc_sugar = "res://Assets/pngs/misc/sugar.png"
const misc_vanilla = "res://Assets/pngs/misc/vanilla.png"
const misc_egg = "res://Assets/pngs/misc/egg.png"
const misc_salt = "res://Assets/pngs/misc/salt.png"
const misc_pepper = "res://Assets/pngs/misc/pepper.png"

const syrup_agave = "res://Assets/pngs/syrup/agave_syrup.png"
const syrup_basil = "res://Assets/pngs/syrup/basil_syrup.png"
const syrup_cinnamon = "res://Assets/pngs/syrup/cinnamon_syrup.png"
const syrup_simple = "res://Assets/pngs/syrup/simple_syrup.png"

const water_coconut = "res://Assets/pngs/water/coconut_water.png"
const water_distilled = "res://Assets/pngs/water/distilled_water.png"
const water_sparkling = "res://Assets/pngs/water/sparkling_water.png"
const water_tonic = "res://Assets/pngs/water/tonic_water.png"
const water = "res://Assets/pngs/water/water.png"

const liqueurs_berry = "res://Assets/pngs/liqueurs/liqueurs_berry.png"
const liqueurs_chocolate = "res://Assets/pngs/liqueurs/liqueurs_chocolate.png"
const liqueurs_coffee = "res://Assets/pngs/liqueurs/liqueurs_coffee.png"
const liqueurs_creme = "res://Assets/pngs/liqueurs/liqueurs_creme.png"
const liqueurs_flower = "res://Assets/pngs/liqueurs/liqueurs_flower.png"
const liqueurs_fruit = "res://Assets/pngs/liqueurs/liqueurs_fruit.png"
const liqueurs_herbal = "res://Assets/pngs/liqueurs/liqueurs_herbal.png"
const liqueurs_honey = "res://Assets/pngs/liqueurs/liqueurs_honey.png"
const liqueurs_nut = "res://Assets/pngs/liqueurs/liqueurs_nut.png"
const liqueurs_savory = "res://Assets/pngs/liqueurs/liqueurs_savory.png"
const liqueurs_whiskey = "res://Assets/pngs/liqueurs/liqueurs_whiskey.png"

const liquor_bourbon = "res://Assets/pngs/liquor/bourbon.png"
const liquor_brandy = "res://Assets/pngs/liquor/brandy.png"
const liquor_gin = "res://Assets/pngs/liquor/gin.png"
const liquor_rum = "res://Assets/pngs/liquor/rum.png"
const liquor_tequila = "res://Assets/pngs/liquor/tequila.png"
const liquor_vodka = "res://Assets/pngs/liquor/vodka.png"
const liquor_whiskey = "res://Assets/pngs/liquor/whiskey.png"

const wine_dry = "res://Assets/pngs/wine/wine_dry.png"
const wine_sparkling = "res://Assets/pngs/wine/wine_sparkling.png"
const wine_sweet = "res://Assets/pngs/wine/wine_sweet.png"

#Glasses Image Scales
var img_scale_glass

const img_scale_glass_highball = Vector2(.15, .15)
const img_scale_glass_sour = Vector2(.15, .15)
const img_scale_glass_wine = Vector2(.15, .15)
const img_scale_glass_cocktail = Vector2(.15, .15)
const img_scale_glass_old_fashioned = Vector2(.15, .15)
const img_scale_glass_short_cocktail = Vector2(.15, .15)
const img_scale_glass_martini = Vector2(.15, .15)
const img_scale_glass_champagne_coupe = Vector2(.15, .15)
const img_scale_glass_champagne_flute = Vector2(.15, .15)
const img_scale_copper_mug = Vector2(.15, .15)
const img_scale_glass_coupe = Vector2(.15, .15)
const img_scale_glass_margarita = Vector2(.15, .15)
const img_scale_glass_hurricane = Vector2(.15, .15)
const img_scale_glass_poco_grande = Vector2(.15, .15)
const img_scale_glass_cobbler = Vector2(.15, .15)
const img_scale_glass_zombie = Vector2(.15, .15)
const img_scale_glass_shot = Vector2(.15, .15)
const img_scale_glass_custom = Vector2(.15, .15)

#Glasses Image Paths
const glass_highball = "res://Assets/pngs/glass/highball.png"
const glass_sour = "res://Assets/pngs/glass/sour.png"
const glass_wine = "res://Assets/pngs/glass/wine.png"
const glass_cocktail = "res://Assets/pngs/glass/cocktail.png"
const glass_old_fashioned = "res://Assets/pngs/glass/old-fashioned.png"
const glass_short_cocktail = "res://Assets/pngs/glass/short_cocktail.png"
const glass_martini = "res://Assets/pngs/glass/martini.png"
const glass_champagne_flute = "res://Assets/pngs/glass/champagne_flute.png"
const glass_champagne_coupe = "res://Assets/pngs/glass/champagne_coupe.png"
const glass_margarita = "res://Assets/pngs/glass/margarita.png"
const glass_copper_mug = "res://Assets/pngs/glass/copper_mug.png"
const glass_coupe = "res://Assets/pngs/glass/coupe.png"
const glass_hurricane = "res://Assets/pngs/glass/hurricane.png"
const glass_poco_grande = "res://Assets/pngs/glass/poco_grande.png"
const glass_cobbler = "res://Assets/pngs/glass/cobbler.png"
const glass_zombie = "res://Assets/pngs/glass/zombie.png"
const glass_shot = "res://Assets/pngs/glass/shot.png"
const glass_custom = "res://Assets/pngs/glass/custom.png"

@onready var viewport = get_viewport().size

func generate_image(image_request):
	match (image_request):
		#Drinks
		"beer":
			var img = preload(beer)
			img_scale = img_scale_beer
			spawn_image(img)
			return str(image_request)
			
		"floral-bitters":
			var img = preload(bitters_floral)
			img_scale = img_scale_bitters
			spawn_image(img)
			return str(image_request)
			
		"fruit-bitters":
			var img = preload(bitters_fruit)
			img_scale = img_scale_bitters
			spawn_image(img)
			return str(image_request)
			
		"herbal-bitters":
			var img = preload(bitters_herbal)
			img_scale = img_scale_bitters
			spawn_image(img)
			return str(image_request)
			
		"spicy-bitters":
			var img = preload(bitters_spicy)
			img_scale = img_scale_bitters
			spawn_image(img)
			return str(image_request)
			
		"vegetable-bitters":
			var img = preload(bitters_vegetable)
			img_scale = img_scale_bitters
			spawn_image(img)
			return str(image_request)
			
		"cherry":
			var img = preload(fruit_cherry)
			img_scale = img_scale_fruit
			spawn_image(img)
			return str(image_request)
		
		"lemon":
			var img = preload(fruit_lemon)
			img_scale = img_scale_fruit
			spawn_image(img)
			return str(image_request)
		
		"lime":
			var img = preload(fruit_lime)
			img_scale = img_scale_fruit
			spawn_image(img)
			return str(image_request)
		
		"olive":
			var img = preload(fruit_olive)
			img_scale = img_scale_fruit
			spawn_image(img)
			return str(image_request)
		
		"orange":
			var img = preload(fruit_orange)
			img_scale = img_scale_fruit
			spawn_image(img)
			return str(image_request)
		
		"passion-fruit":
			var img = preload(fruit_passion)
			img_scale = img_scale_fruit
			spawn_image(img)
			return str(image_request)
		
		"pineapple":
			var img = preload(fruit_pineapple)
			img_scale = img_scale_fruit
			spawn_image(img)
			return str(image_request)
		
		"cranberry-juice":
			var img = preload(juice_cranberry)
			img_scale = img_scale_juice
			spawn_image(img)
			return str(image_request)
		
		"lemon-juice":
			var img = preload(juice_lemon)
			img_scale = img_scale_juice
			spawn_image(img)
			return str(image_request)
		
		"lime-juice":
			var img = preload(juice_lime)
			img_scale = img_scale_juice
			spawn_image(img)
			return str(image_request)
		
		"olive-brine":
			var img = preload(brine_olive)
			img_scale = img_scale_juice
			spawn_image(img)
			return str(image_request)
		
		"orange-juice":
			var img = preload(juice_orange)
			img_scale = img_scale_juice
			spawn_image(img)
			return str(image_request)
		
		"pineapple-juice":
			var img = preload(juice_pineapple)
			img_scale = img_scale_juice
			spawn_image(img)
			return str(image_request)
		
		"tomato-juice":
			var img = preload(juice_tomato)
			img_scale = img_scale_juice
			spawn_image(img)
			return str(image_request)
			
		"berry-liqueur":
			var img = preload(liqueurs_berry)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"chocolate-liqueur":
			var img = preload(liqueurs_chocolate)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"coffee-liqueur":
			var img = preload(liqueurs_coffee)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"creme-liqueur":
			var img = preload(liqueurs_creme)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"flower-liqueur":
			var img = preload(liqueurs_flower)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"fruit-liqueur":
			var img = preload(liqueurs_fruit)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"herbal-liqueur":
			var img = preload(liqueurs_herbal)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"honey-liqueur":
			var img = preload(liqueurs_honey)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"nut-liqueur":
			var img = preload(liqueurs_nut)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"savory-liqueur":
			var img = preload(liqueurs_savory)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"whiskey-liqueur":
			var img = preload(liqueurs_whiskey)
			img_scale = img_scale_liqueurs
			spawn_image(img)
			return str(image_request)
			
		"bourbon":
			var img = preload(liquor_bourbon)
			img_scale = img_scale_liquor
			spawn_image(img)
			return str(image_request)
			
		"brandy":
			var img = preload(liquor_brandy)
			img_scale = img_scale_liquor
			spawn_image(img)
			return str(image_request)
			
		"gin":
			var img = preload(liquor_gin)
			img_scale = img_scale_liquor
			spawn_image(img)
			return str(image_request)
			
		"rum":
			var img = preload(liquor_rum)
			img_scale = img_scale_liquor
			spawn_image(img)
			return str(image_request)
			
		"tequila":
			var img = preload(liquor_tequila)
			img_scale = img_scale_liquor
			spawn_image(img)
			return str(image_request)
			
		"vodka":
			var img = preload(liquor_vodka)
			img_scale = img_scale_liquor
			spawn_image(img)
			return str(image_request)
			
		"whiskey":
			var img = preload(liquor_whiskey)
			img_scale = img_scale_liquor
			spawn_image(img)
			return str(image_request)
		
		"basil-leaves":
			var img = preload(misc_basil_leaves)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"mint-leaves":
			var img = preload(misc_mint_leaves)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"coconut-milk":
			var img = preload(misc_coconut_milk)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"cream":
			var img = preload(misc_cream)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"egg":
			var img = preload(misc_egg)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"espresso":
			var img = preload(misc_espresso)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"honey":
			var img = preload(misc_honey)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"nutmeg":
			var img = preload(misc_nutmeg)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"pepper":
			var img = preload(misc_pepper)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
			
		"salt":
			var img = preload(misc_salt)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"soda-pop":
			var img = preload(misc_soda_pop)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"sugar":
			var img = preload(misc_sugar)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"vanilla":
			var img = preload(misc_vanilla)
			img_scale = img_scale_misc
			spawn_image(img)
			return str(image_request)
		
		"agave-syrup":
			var img = preload(syrup_agave)
			img_scale = img_scale_syrup
			spawn_image(img)
			return str(image_request)
		
		"basil-syrup":
			var img = preload(syrup_basil)
			img_scale = img_scale_syrup
			spawn_image(img)
			return str(image_request)
		
		"cinnamon-syrup":
			var img = preload(syrup_cinnamon)
			img_scale = img_scale_syrup
			spawn_image(img)
			return str(image_request)
		
		"simple-syrup":
			var img = preload(syrup_simple)
			img_scale = img_scale_syrup
			spawn_image(img)
			return str(image_request)
		
		"coconut-water":
			var img = preload(water_coconut)
			img_scale = img_scale_water
			spawn_image(img)
			return str(image_request)
		
		"distilled-water":
			var img = preload(water_distilled)
			img_scale = img_scale_water
			spawn_image(img)
			return str(image_request)
		
		"sparkling-water":
			var img = preload(water_sparkling)
			img_scale = img_scale_water
			spawn_image(img)
			return str(image_request)
		
		"tonic-water":
			var img = preload(water_tonic)
			img_scale = img_scale_water
			spawn_image(img)
			return str(image_request)
		
		"water":
			var img = preload(water)
			img_scale = img_scale_water
			spawn_image(img)
			return str(image_request)
			
		"dry-wine":
			var img = preload(wine_dry)
			img_scale = img_scale_wine
			spawn_image(img)
			return str(image_request)
			
		"sparkling-wine":
			var img = preload(wine_sparkling)
			img_scale = img_scale_wine
			spawn_image(img)
			return str(image_request)
			
		"sweet-wine":
			var img = preload(wine_sweet)
			img_scale = img_scale_wine
			spawn_image(img)
			return str(image_request)
				
		_:
			return "empty"
			
func clear_image(image_request):
	match (image_request):
		"beer":
			if $Image.texture == preload(beer):
				$Image.texture = null
			
			return str(image_request)
			
		"floral-bitters":
			if $Image.texture == preload(bitters_floral):
				$Image.texture = null
			
			return str(image_request)
			
		"fruit-bitters":
			if $Image.texture == preload(bitters_fruit):
				$Image.texture = null
			
			return str(image_request)
		
		"herbal-bitters":
			if $Image.texture == preload(bitters_herbal):
				$Image.texture = null
			
			return str(image_request)
		
		"spicy-bitters":
			if $Image.texture == preload(bitters_spicy):
				$Image.texture = null
			
			return str(image_request)
			
		"vegetable-bitters":
			if $Image.texture == preload(bitters_vegetable):
				$Image.texture = null
			
			return str(image_request)
		
		"cherry":
			if $Image.texture == preload(fruit_cherry):
				$Image.texture = null
			
			return str(image_request)
		
		"lemon":
			if $Image.texture == preload(fruit_lemon):
				$Image.texture = null
			
			return str(image_request)
		
		"lime":
			if $Image.texture == preload(fruit_lime):
				$Image.texture = null
			
			return str(image_request)
		
		"olive":
			if $Image.texture == preload(fruit_olive):
				$Image.texture = null
			
			return str(image_request)
		
		"orange":
			if $Image.texture == preload(fruit_orange):
				$Image.texture = null
			
			return str(image_request)
		
		"passion-fruit":
			if $Image.texture == preload(fruit_passion):
				$Image.texture = null
			
			return str(image_request)
		
		"pineapple":
			if $Image.texture == preload(fruit_pineapple):
				$Image.texture = null
			
			return str(image_request)
		
		"cranberry-juice":
			if $Image.texture == preload(juice_cranberry):
				$Image.texture = null
			
			return str(image_request)
		
		"lemon-juice":
			if $Image.texture == preload(juice_lemon):
				$Image.texture = null
			
			return str(image_request)
		
		"lime-juice":
			if $Image.texture == preload(juice_lime):
				$Image.texture = null
			
			return str(image_request)
		
		"olive-brine":
			if $Image.texture == preload(brine_olive):
				$Image.texture = null
			
			return str(image_request)
		
		"orange-juice":
			if $Image.texture == preload(juice_orange):
				$Image.texture = null
			
			return str(image_request)
		
		"pineapple-juice":
			if $Image.texture == preload(juice_pineapple):
				$Image.texture = null
			
			return str(image_request)
		
		"tomato-juice":
			if $Image.texture == preload(juice_tomato):
				$Image.texture = null
			
			return str(image_request)
		
		"berry-liqueur":
			if $Image.texture == preload(liqueurs_berry):
				$Image.texture = null
			
			return str(image_request)
			
		"chocolate-liqueur":
			if $Image.texture == preload(liqueurs_chocolate):
				$Image.texture = null
			
			return str(image_request)
			
		"coffee-liqueur":
			if $Image.texture == preload(liqueurs_coffee):
				$Image.texture = null
			
			return str(image_request)
			
		"creme-liqueur":
			if $Image.texture == preload(liqueurs_creme):
				$Image.texture = null
			
			return str(image_request)
			
		"flower-liqueur":
			if $Image.texture == preload(liqueurs_flower):
				$Image.texture = null
			
			return str(image_request)
			
		"fruit-liqueur":
			if $Image.texture == preload(liqueurs_fruit):
				$Image.texture = null
			
			return str(image_request)
			
		"herbal-liqueur":
			if $Image.texture == preload(liqueurs_herbal):
				$Image.texture = null
			
			return str(image_request)
			
		"honey-liqueur":
			if $Image.texture == preload(liqueurs_honey):
				$Image.texture = null
			
			return str(image_request)
			
		"nut-liqueur":
			if $Image.texture == preload(liqueurs_nut):
				$Image.texture = null
			
			return str(image_request)
			
		"savory-liqueur":
			if $Image.texture == preload(liqueurs_savory):
				$Image.texture = null
			
			return str(image_request)
			
		"whiskey-liqueur":
			if $Image.texture == preload(liqueurs_whiskey):
				$Image.texture = null
			
			return str(image_request)
			
		"bourbon":
			if $Image.texture == preload(liquor_bourbon):
				$Image.texture = null
			
			return str(image_request)
			
		"brandy":
			if $Image.texture == preload(liquor_brandy):
				$Image.texture = null
			
			return str(image_request)
			
		"gin":
			if $Image.texture == preload(liquor_gin):
				$Image.texture = null
			
			return str(image_request)
			
		"rum":
			if $Image.texture == preload(liquor_rum):
				$Image.texture = null
			
			return str(image_request)
			
		"tequila":
			if $Image.texture == preload(liquor_tequila):
				$Image.texture = null
			
			return str(image_request)
			
		"vodka":
			if $Image.texture == preload(liquor_vodka):
				$Image.texture = null
			
			return str(image_request)
			
		"whiskey":
			if $Image.texture == preload(liquor_whiskey):
				$Image.texture = null
			
			return str(image_request)
		
		"basil-leaves":
			if $Image.texture == preload(misc_basil_leaves):
				$Image.texture = null
			
			return str(image_request)
		
		"mint-leaves":
			if $Image.texture == preload(misc_mint_leaves):
				$Image.texture = null
			
			return str(image_request)
		
		"coconut-milk":
			if $Image.texture == preload(misc_coconut_milk):
				$Image.texture = null
			
			return str(image_request)
		
		"cream":
			if $Image.texture == preload(misc_cream):
				$Image.texture = null
			
			return str(image_request)
		
		"egg":
			if $Image.texture == preload(misc_egg):
				$Image.texture = null
			
			return str(image_request)
		
		"espresso":
			if $Image.texture == preload(misc_espresso):
				$Image.texture = null
			
			return str(image_request)
		
		"honey":
			if $Image.texture == preload(misc_honey):
				$Image.texture = null
			
			return str(image_request)
		
		"nutmeg":
			if $Image.texture == preload(misc_nutmeg):
				$Image.texture = null
			
			return str(image_request)
		
		"pepper":
			if $Image.texture == preload(misc_pepper):
				$Image.texture = null
			
			return str(image_request)
		
		"salt":
			if $Image.texture == preload(misc_salt):
				$Image.texture = null
			
			return str(image_request)
		
		"soda-pop":
			if $Image.texture == preload(misc_soda_pop):
				$Image.texture = null
			
			return str(image_request)
		
		"sugar":
			if $Image.texture == preload(misc_sugar):
				$Image.texture = null
			
			return str(image_request)
		
		"vanilla":
			if $Image.texture == preload(misc_vanilla):
				$Image.texture = null
			
			return str(image_request)
		
		"agave-syrup":
			if $Image.texture == preload(syrup_agave):
				$Image.texture = null
			
			return str(image_request)
		
		"basil-syrup":
			if $Image.texture == preload(syrup_basil):
				$Image.texture = null
			
			return str(image_request)
		
		"cinnamon-syrup":
			if $Image.texture == preload(syrup_cinnamon):
				$Image.texture = null
			
			return str(image_request)
		
		"simple-syrup":
			if $Image.texture == preload(syrup_simple):
				$Image.texture = null
			
			return str(image_request)
		
		"coconut-water":
			if $Image.texture == preload(water_coconut):
				$Image.texture = null
			
			return str(image_request)
		
		"distilled-water":
			if $Image.texture == preload(water_distilled):
				$Image.texture = null
			
			return str(image_request)
		
		"sparkling-water":
			if $Image.texture == preload(water_sparkling):
				$Image.texture = null
			
			return str(image_request)
		
		"tonic-water":
			if $Image.texture == preload(water_tonic):
				$Image.texture = null
			
			return str(image_request)
		
		"water":
			if $Image.texture == preload(water):
				$Image.texture = null
			
			return str(image_request)
		
		"dry-wine":
			if $Image.texture == preload(wine_dry):
				$Image.texture = null
			
			return str(image_request)
			
		"sparkling-wine":
			if $Image.texture == preload(wine_sparkling):
				$Image.texture = null
			
			return str(image_request)
			
		"sweet-wine":
			if $Image.texture == preload(wine_sweet):
				$Image.texture = null
			
			return str(image_request)
		
		"any":
			if $Image.texture != null:
				$Image.texture = null
			
			return str(image_request)
		
		_:
			return "empty"

func spawn_image(image_ref):
	$Image.texture = image_ref

	scale = img_scale
	
	global_position.x = viewport.x * .75
	global_position.y = viewport.y * .55
	
func generate_image_glass(image_request):
	#Glasses
	match (image_request):
		"highball":
			var img = preload(glass_highball)
			img_scale_glass = img_scale_glass_highball
			spawn_image_glass(img)
			return "Highball Glass"
		
		"sour":
			var img = preload(glass_sour)
			img_scale_glass = img_scale_glass_sour
			spawn_image_glass(img)
			return "Sour Glass"
		
		"wine":
			var img = preload(glass_wine)
			img_scale_glass = img_scale_glass_wine
			spawn_image_glass(img)
			return "Wine Glass"
		
		"cocktail":
			var img = preload(glass_cocktail)
			img_scale_glass = img_scale_glass_cocktail
			spawn_image_glass(img)
			return "Cocktail Glass"
		
		"old-fashioned":
			var img = preload(glass_old_fashioned)
			img_scale_glass = img_scale_glass_old_fashioned
			spawn_image_glass(img)
			return "Old Fashioned Glass"
		
		"short-cocktail":
			var img = preload(glass_short_cocktail)
			img_scale_glass = img_scale_glass_short_cocktail
			spawn_image_glass(img)
			return "Short Cocktail Glass"
		
		"martini":
			var img = preload(glass_martini)
			img_scale_glass = img_scale_glass_martini
			spawn_image_glass(img)
			return "Martini Glass"
		
		"champagne-flute":
			var img = preload(glass_champagne_flute)
			img_scale_glass = img_scale_glass_champagne_flute
			spawn_image_glass(img)
			return "Champagne Flute Glass"
		
		"champagne-coupe":
			var img = preload(glass_champagne_coupe)
			img_scale_glass = img_scale_glass_champagne_coupe
			spawn_image_glass(img)
			return "Champage Coupe Glass"
		
		"copper-mug":
			var img = preload(glass_copper_mug)
			img_scale_glass = img_scale_copper_mug
			spawn_image_glass(img)
			return "Copper Mug"
		
		"coupe":
			var img = preload(glass_coupe)
			img_scale_glass = img_scale_glass_coupe
			spawn_image_glass(img)
			return "Coupe Glass"
		
		"margarita":
			var img = preload(glass_margarita)
			img_scale_glass = img_scale_glass_margarita
			spawn_image_glass(img)
			return "Margarita Glass"
		
		"hurricane":
			var img = preload(glass_hurricane)
			img_scale_glass = img_scale_glass_hurricane
			spawn_image_glass(img)
			return "Hurricane Glass"
		
		"poco-grande":
			var img = preload(glass_poco_grande)
			img_scale_glass = img_scale_glass_poco_grande
			spawn_image_glass(img)
			return "Poco Grande Glass"
		
		"cobbler":
			var img = preload(glass_cobbler)
			img_scale_glass = img_scale_glass_cobbler
			spawn_image_glass(img)
			return "Cobbler Glass"
		
		"zombie":
			var img = preload(glass_zombie)
			img_scale_glass = img_scale_glass_zombie
			spawn_image_glass(img)
			return "Zombie Glass"
		
		"shot-glass":
			var img = preload(glass_shot)
			img_scale_glass = img_scale_glass_shot
			spawn_image_glass(img)
			return "Shot Glass"
		
		"custom":
			var img = preload(glass_custom)
			img_scale_glass = img_scale_glass_custom
			spawn_image_glass(img)
			return "Glass"
	
func spawn_image_glass(image_ref):
	$Image.texture = image_ref
	
	scale = img_scale_glass
	
	global_position.x = viewport.x * .75
	global_position.y = viewport.y * .55
	
