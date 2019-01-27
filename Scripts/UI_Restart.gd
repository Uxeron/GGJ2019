extends TouchScreenButton

var disabled = true

func _on_Restart_button():
	if disabled: return

	#get_node("/root/MainScene/Music").stop()
	#Global.music_position = get_node("/root/MainScene/Music").get_playback_position()
	get_node("/root/MainScene/Control/Transition").reloading = true
	get_node("/root/MainScene/Control/Transition").transition()
