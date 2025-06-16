extends OptionButton

@onready var container_ref = $".."
var msg = ""
var inv = []

func _ready():
	inv = Inventory.load_inventory()
	for i in range(0, inv.size()):
		add_item(inv[i], i)

func _on_item_selected(index):
	msg = "get " + str(inv[index])
	
func _on_select_button_pressed():
	global.get_msg = msg
	container_ref.queue_free()
