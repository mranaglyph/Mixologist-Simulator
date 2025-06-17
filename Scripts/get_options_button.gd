extends OptionButton

@onready var container_ref = $".."
var msg = ""
var inv_list = []

func _ready():
	if global.inv.size() <= 0:
		global.inv = Inventory.load_inventory()
		for i in range(0, global.inv.size()):
			add_item(global.inv[i], i)
		
		inv_list = global.inv
		global.inv = []
	else:
		for i in range(0, inv_list.size()):
			add_item(inv_list[i], i)

func _on_item_selected(index):
	msg = "get " + str(inv_list[index])
	
func _on_select_button_pressed():
	global.get_msg = msg
	container_ref.queue_free()
