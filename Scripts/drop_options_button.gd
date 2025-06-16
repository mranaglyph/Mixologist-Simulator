extends OptionButton

@onready var container_ref = $".."
var msg = ""

func _ready():
	if global.drop_list.size() <= 0 || global.drop_list == null:
		container_ref.queue_free()
	else:
		for i in range(0, global.drop_list.size()):
			add_item(global.drop_list[i], i)

func _process(_delta):
	if global.drop_list.size() <= 0 || global.drop_list == null:
		container_ref.queue_free()

func _on_item_selected(index):
	msg = "drop " + str(global.drop_list[index])
	
func _on_select_button_pressed():
	global.drop_msg = msg
	container_ref.queue_free()
