extends Tween

var skipped = false
const ANIMATION_TIME = 2
func _ready():
	# Move the "You fell!" label down
	interpolate_property($Label, "rect_position",
						Vector2(-30, -400),
						Vector2(-30, 500),
						ANIMATION_TIME,
						Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)


func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if is_active():
				# skip animation
				emit_signal("tween_completed", $Label, "rect_position")
				seek(100)


func _on_Tween_completed(object, key):
	if object is Label:
		# Make the restart button visible
		$Continue.disabled = false
		interpolate_property($Continue, "modulate",
							Color(1.0, 1.0, 1.0, 0.0),
							Color(1.0, 1.0, 1.0, 1.0),
							2,
							Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$ExitButton.disabled = false
		interpolate_property($ExitButton, "modulate",
							Color(1.0, 1.0, 1.0, 0.0),
							Color(1.0, 1.0, 1.0, 1.0),
							2,
							Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		start()
