extends RigidBody2D

const RIGIDBODY_SPEED = 2000 # set a smaller value for slower rigidbody movement

var is_dragging = false
var mouse_is_over = false
var keydown_mouseleft = false
var rigidbody_vector = 0


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed: keydown_mouseleft = true
	
		if event.button_index == BUTTON_LEFT and !event.pressed:
			keydown_mouseleft = false
			is_dragging = false


func _physics_process(delta):
	if keydown_mouseleft and mouse_is_over:
		var mouse_distance = position.distance_to(get_global_mouse_position())
		is_dragging = true

		if (mouse_distance <= 5.0):
			rigidbody_vector = 0
			set_linear_velocity(Vector2())
		else:
			rigidbody_vector = (get_global_mouse_position() - position).normalized()
			set_linear_velocity(rigidbody_vector * RIGIDBODY_SPEED * mouse_distance * delta)

		if not keydown_mouseleft or not mouse_is_over:
			is_dragging = false
			set_linear_velocity(Vector2())


func _on_Box_mouse_entered():
	mouse_is_over = true

func _on_Box_mouse_exited():
	if not is_dragging: mouse_is_over = false