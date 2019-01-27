extends TouchScreenButton
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	get_node("/root/MainMenu/Music").play()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_PlayButton_released():
	get_node("/root/MainMenu/Music").stop()
	print("stoped")
	Global.music_position = get_node("/root/MainMenu/Music").get_playback_position()
	
	get_tree().change_scene("res://Scenes/MainScene.tscn")
