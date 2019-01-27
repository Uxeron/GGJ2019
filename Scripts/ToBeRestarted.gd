extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var max_rotation_degrees = 23.0

func _ready():
	$Music.play(Global.music_position)
	print("toBeRestarted Music")
	
	# Called when the node is added to the scene for the first time.
	# Initialization here

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
