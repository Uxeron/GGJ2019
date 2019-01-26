extends KinematicBody2D

var speed = 0
var accel = 1.0
var beingCarried = false
var house

func _ready():
	house = get_parent()
	$RayCast2D.force_raycast_update()
	if $RayCast2D.is_colliding():
		global_position = $RayCast2D.get_collision_point()
	else:
		print("shit")

func _physics_process(delta):
	if beingCarried: return
	
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
	

func carryStart(player):
	beingCarried = true
	house.remove_child(self)
	player.add_child(self)
	changeCollision(false)
	position = Vector2(0, 0)


func carryEnd(player):
	if len($Area2D.get_overlapping_areas()) == 0:
		beingCarried = false
		var globPos = global_position
		player.remove_child(self)
		house.add_child(self)
		global_position = globPos
		changeCollision(true)
		_ready()
		return true
	return false
	
func changeCollision(val):
	set_collision_layer_bit(0, val)
	set_collision_mask_bit(0, val)
	set_collision_mask_bit(1, val)