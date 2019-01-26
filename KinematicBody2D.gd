extends KinematicBody2D

const WALK_SPEED = 200

var velocity = Vector2()

func _physics_process(delta):
    #velocity.y += delta * GRAVITY
	if Input.get_accelerometer().x < -0.9 or Input.is_key_pressed(KEY_A):
		move_and_collide(Vector2(-WALK_SPEED * delta,0).rotated(get_parent().rotation))
		velocity = Vector2(-WALK_SPEED * delta,0)
	if Input.get_accelerometer().x > 0.9 or Input.is_key_pressed(KEY_D):
		move_and_collide(Vector2(WALK_SPEED * delta,0).rotated(get_parent().rotation))
		velocity = Vector2(WALK_SPEED * delta,0)
		
func _process(delta):
	if velocity.length() > 0:
		velocity = velocity * WALK_SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	if velocity.x == -INF or velocity.x == +INF:
		$AnimatedSprite.animation = "idle"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false