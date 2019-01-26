extends Sprite

var rotSpeed = 0
var rotSpdDelta = 0.005
var leftMass = 0
var rightMass = 0
var sliding = false
var waitingToStart = true

var speed = 0
var accel = 2.0


func _physics_process(delta):
	if waitingToStart:
		return
	
	if sliding:
		if global_position.x < -1000 or global_position.x > 1000:
			return
		speed += accel
		if rotation < 0:
			position += Vector2(-speed * delta, 0.0).rotated(rotation)
		else:
			position += Vector2(speed * delta, 0.0).rotated(rotation)
		return
		
	rightMass = 0
	leftMass = 0

	
	for body in $Area2D.get_overlapping_bodies():
		if body.get("beingCarried"):
			if body.beingCarried: continue
			
		if body.get("carrying"):
			if body.carrying:
				if body.position.x > 0:
					rightMass += 1
				else:
					leftMass += 1
				
		if body.position.x > 0:
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


func _on_Area2D2_area_entered(area):
	sliding = true
	get_node("/root/MainScene/ToBeRestarted/UI_Gameover/Tween").start()
	$Timer.start()


func _on_Particle_Wait_timeout():
	$Particles2D.emitting = true
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	$Particles2D.amount = 60


func _on_TimerStart_timeout():
	waitingToStart = false
