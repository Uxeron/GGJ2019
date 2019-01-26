extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tempPos

func _ready():
	set_process(true)
	tempPos = position
	# Called when the node is added to the scene for the first time.
	# Initialization here

func _process(delta):
	position = Vector2(position.x + 10 * delta, position.y)
	if(position.x > 1300):
		position = tempPos
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
