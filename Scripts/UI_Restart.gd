extends TouchScreenButton
var currLevel
var disabled = true

func _physics_process(delta):
	currLevel = get_node("/root/MainScene").CurrentLevel
func _on_Restart_button():
	if disabled: return

	#get_node("/root/MainScene/Music").stop()
	Global.music_position = get_node("/root/MainScene/"+ currLevel +"/Music").get_playback_position()
	get_node("/root/MainScene/Control/Transition").reloading = true
	get_node("/root/MainScene/Control/Transition").transition()
