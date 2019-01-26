extends TouchScreenButton

var disabled = true
var mouseTouching = false

func _on_Restart_button():
	if disabled: return
	get_node("/root/MainScene/Control/Transition").transition()

