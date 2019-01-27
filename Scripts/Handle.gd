extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var currLevel
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	currLevel = get_node("/root/MainScene").CurrentLevel
	print(currLevel)
	rotation = get_node("/root/MainScene/" + currLevel + "/Home").rotation
	
	#rotation = get_node("res://Scenes/Home.tscn").rotation
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
