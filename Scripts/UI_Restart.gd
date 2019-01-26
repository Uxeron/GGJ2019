extends TouchScreenButton

var disabled = true
var mouseTouching = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if (get_global_mouse_position().x < global_position.x + 300) and (get_global_mouse_position().x > global_position.x) and (get_global_mouse_position().y < global_position.y + 150) and (get_global_mouse_position().y > global_position.y):
				_on_Restart_button()


func _on_Restart_button():
	#get_node("/root/MainScene").reloadScene()
	if disabled: return
	get_node("/root/MainScene/Control/Transition").transition()

