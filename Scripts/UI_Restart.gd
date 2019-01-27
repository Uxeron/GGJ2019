extends TouchScreenButton

var disabled = true

func _on_Restart_button():
	if disabled: return
	get_node("/root/MainScene").reloadScene()
