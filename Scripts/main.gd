extends Control

@export var max_display_lines: int = 35

@onready var parser = $Parser
@onready var res_parent_node = %VBox2
@onready var scroll_container_ref = %ScrollContainer
@onready var scrollbar_ref = scroll_container_ref.get_v_scroll_bar()

const response_scene_ref = preload("res://Scenes/response.tscn")
const resp_ref = preload("res://Scenes/resp.tscn")
const options_ref = "res://Scenes/get_options_button.tscn"
const drop_ref = "res://Scenes/drop_options_button.tscn"

func _ready():
	scrollbar_ref.connect("changed", handle_scrollbar)
	var opening_msg = resp_ref.instantiate()
	opening_msg.text = "You are a bartender. The Mixologist of Dr. Sunglassesatnight Club, the coolest joint this side of the Pacific. Customers will come up to you and ask for different drinks and you will have to mix it and serve them what they ask for. Depending on how long you take, and if you used the right ingredients, you will be graded at the end of the night. At the end of the week, we'll check your performance. Good luck! If you need help simply type 'help', and to start your night type 'start', and remember - mix it up!"
	respond(opening_msg)

func _process(_delta):
	if global.get_msg != "":
		get_selection()
	
	if global.drop_msg != "":
		drop_selection()

func _on_input_text_submitted(my_text: String) -> void:
	if my_text == "": return
	else:
		var res_instance = response_scene_ref.instantiate()
		var resp_returned = parser.command(my_text)
		res_instance.txt_resp(resp_returned)
		respond(res_instance)

func respond(param_one: Control):
	res_parent_node.add_child(param_one)
	limiter()

func handle_scrollbar():
	scroll_container_ref.scroll_vertical = scrollbar_ref.max_value

func limiter():
	if res_parent_node.get_child_count() > max_display_lines:
			var forget_lines = res_parent_node.get_child_count() - max_display_lines
			for i in range(forget_lines):
				res_parent_node.get_child(i).queue_free()

func _on_holding_button_pressed():
	_on_input_text_submitted("holding")

func _on_get_button_pressed():
	var op = preload(options_ref)
	var options = op.instantiate()
	res_parent_node.add_child(options)
	
func get_selection():
	_on_input_text_submitted(global.get_msg)
	global.get_msg = ""

func _on_drop_button_pressed():
	var dp = preload(drop_ref)
	var drop_options = dp.instantiate()
	res_parent_node.add_child(drop_options)

func drop_selection():
	_on_input_text_submitted(global.drop_msg)
	global.drop_msg = ""

func _on_mix_button_pressed():
	if global.drink_expected != "" && global.drink_exp_ing != "":
		var drink_name_final = ""
		var drink_name = global.drink_expected.split(" ")
		for i in range(0, drink_name.size()):
			if i + 1 == drink_name.size():
				drink_name_final += drink_name[i]
			else:
				drink_name_final += drink_name[i] + "-"
		
		_on_input_text_submitted("mix " + str(drink_name_final))
