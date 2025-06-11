extends LineEdit

var focus = false

func _ready():
	_current_focus()

func _process(_delta):
	var enter = Input.is_action_just_pressed("ui_accept")
	if !focus && enter: _current_focus()

func _on_text_submitted(_my_text: String) -> void:
	clear()

func _on_focus_exited() -> void:
	focus = false

func _on_focus_entered() -> void:
	focus = true

func _current_focus():
	grab_focus()
	focus = true
