extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	if Input.is_key_pressed(KEY_A):
		rotate(-1.0 * delta)
	if Input.get_accelerometer().x < 0:
		rotate(-1.0 * delta)
	if Input.get_accelerometer().x > 0:
		rotate(1.0 * delta)
	if Input.is_key_pressed(KEY_D):
		rotate(1.0 * delta)
