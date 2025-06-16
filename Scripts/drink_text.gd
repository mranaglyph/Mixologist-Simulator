extends RichTextLabel

func _ready():
	text = ""

func _process(_delta):
	if (!global.drink_exp_ing == "" && !global.drink_expected == "") && global.cust_spawned == false:
		global.drink_expected = ""
		global.drink_exp_ing = ""
		text = ""
	elif (!global.drink_exp_ing == "" && global.drink_expected == "") && global.cust_spawned == false:
		global.drink_exp_ing = ""
		text = ""
	elif (global.drink_exp_ing == "" && !global.drink_expected == "") && global.cust_spawned == false:
		global.drink_expected = ""
		text = ""
	else:
		text = "%s\n%s" % [global.drink_expected, global.drink_exp_ing]
