extends KinematicBody2D

const WALK_SPEED = 200

var velocity = Vector2()

func _physics_process(delta):
    #velocity.y += delta * GRAVITY
	if Input.get_accelerometer().x < -0.8 or Input.is_key_pressed(KEY_A):
		move_and_collide(Vector2(-WALK_SPEED * delta,0).rotated(get_parent().rotation))
	if Input.get_accelerometer().x > 0.8 or Input.is_key_pressed(KEY_D):
        move_and_collide(Vector2(WALK_SPEED * delta,0).rotated(get_parent().rotation))