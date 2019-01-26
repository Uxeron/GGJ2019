extends Sprite

var rotSpeed = 0
var rotSpdDelta = 0.0001
var force = 0
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
		
	force = 0
	
	for body in $Area2D.get_overlapping_bodies():
		if body.get("beingCarried"):
			if body.beingCarried: continue
			
		if body.get("carrying"):
			if body.carrying:
				force += body.position.x / 10.0
		force += body.position.x / 10.0

	rotSpeed += rotSpdDelta * force
	rotate(rotSpeed * delta)


func _on_Area2D2_area_entered(area):
	sliding = true
	var currLevel = get_node("/root/MainScene").CurrentLevel
	get_node("/root/MainScene/" + currLevel + "/UI_Gameover/Tween").start()
	$Timer.start()


func _on_Particle_Wait_timeout():
	$Particles2D.emitting = true
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	$Particles2D.amount = 60


func _on_TimerStart_timeout():
	waitingToStart = false
