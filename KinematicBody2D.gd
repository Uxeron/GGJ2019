extends KinematicBody2D

const WALK_SPEED = 200

var velocity = Vector2()

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
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = "idle"
		$AnimatedSprite.flip_h = false