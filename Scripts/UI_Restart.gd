extends TouchScreenButton

var disabled = true

func _physics_process(delta):
	if is_pressed():
		_on_Restart_button()
		disabled = true

func _on_Restart_button():
	#get_node("/root/MainScene").reloadScene()
	if disabled: return
	get_node("/root/MainScene/Control/Transition").transition(get_viewport().get_texture(), global_position)
