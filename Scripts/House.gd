extends Sprite

var rotSpeed = 0
var rotSpdDelta = 0.0005
var leftMass = 0
var rightMass = 0
const houseWidth = 480

func _ready():
	pass

func _physics_process(delta):
	rightMass = 0
	leftMass = 0
	
	for body in $Area2D.get_overlapping_bodies():
		if body.position.x > position.x:
			rightMass += 1
		else:
			leftMass += 1

	
	#if Input.is_key_pressed(KEY_A):
	if rightMass < leftMass:
		rotSpeed -= rotSpdDelta;
	#elif Input.is_key_pressed(KEY_D):
	elif rightMass > leftMass:
		rotSpeed += rotSpdDelta;
	else:
		if rotSpeed > 0:
			rotSpeed -= rotSpdDelta;
		elif rotSpeed < 0:
			rotSpeed += rotSpdDelta;
	
	rotate(rotSpeed * delta)
