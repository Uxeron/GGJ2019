extends TouchScreenButton


func _on_Restart_button():
	#get_node("/root/MainScene").reloadScene()
	get_node("/root/MainScene/Control/Transition").transition(get_viewport().get_texture(), rect_global_position)
