extends KinematicBody2D

export var WALK_SPEED = 200

var velocity = Vector2()
var carrying = false
var box = null

func _ready():
	$RayCast2D.force_raycast_update()
	if $RayCast2D.is_colliding():
		global_position = $RayCast2D.get_collision_point()
		position.y -= 41
	else:
		print("wack")

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if !carrying:
				var boxes = $FurnitureCollider.get_overlapping_bodies()
				if len(boxes) > 0:
					carrying = true

					var closestBox = boxes[0]
					var closestDist = position.distance_to(boxes[0].position)
					for evalBox in boxes:
						if evalBox == closestBox: continue
						
						if position.distance_to(evalBox.position) < closestDist:
							closestDist = position.distance_to(evalBox.position)
							closestBox = evalBox
						
					box = closestBox
					box.carryStart(self)
			else:
				if box.carryEnd(self):
					carrying = false
					box = null
				

func _physics_process(delta):
    #velocity.y += delta * GRAVITY
	if Input.get_accelerometer().x < -0.9 or Input.is_key_pressed(KEY_A):
		velocity = Vector2(-WALK_SPEED * delta, 0)
		move_and_collide(velocity.rotated(get_parent().rotation))
	elif Input.get_accelerometer().x > 0.9 or Input.is_key_pressed(KEY_D):
		velocity = Vector2(WALK_SPEED * delta, 0)
		move_and_collide(velocity.rotated(get_parent().rotation))
	else:
		velocity = Vector2(0, 0)
		
func _process(delta):
	$AnimatedSprite.play()
	
	if velocity.x != 0:
		if !$Walking.playing:
			$Walking.play()
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$Walking.stop()
		$AnimatedSprite.animation = "idle"
		$AnimatedSprite.flip_h = false