extends KinematicBody2D

var speed = 0
var accel = 1.0

func _ready():
	$RayCast2D.force_raycast_update()
	if $RayCast2D.is_colliding():
		global_position = $RayCast2D.get_collision_point()
	else:
		print("wack")

func _physics_process(delta):
	if get_parent().rotation > 0.5:
		speed += accel
	elif get_parent().rotation < -0.5:
		speed -= accel
	else:
		if speed > 0:
			speed -= accel
		elif speed < 0:
			speed += accel
			
	move_and_collide(Vector2(speed*delta, 0).rotated(get_parent().rotation))