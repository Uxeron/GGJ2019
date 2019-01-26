extends TouchScreenButton

var disabled = true
var mouseTouching = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if mouseTouching:
				_on_Restart_button()
"""
func _physics_process(delta):
	if is_pressed():
		_on_Restart_button()
		disabled = true
"""

func _on_Restart_button():
	#get_node("/root/MainScene").reloadScene()
	if disabled: return
	get_node("/root/MainScene/Control/Transition").transition(get_viewport().get_texture(), global_position)


func _on_Label_mouse_entered():
	mouseTouching = true


func _on_Label_mouse_exited():
	mouseTouching = false
