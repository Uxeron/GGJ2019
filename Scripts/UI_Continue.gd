extends TouchScreenButton

var disabled = true

func _on_Continue_button():
	if disabled: return
	get_node("/root/MainScene/Control/Transition").transition()

