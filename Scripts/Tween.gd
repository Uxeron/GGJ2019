extends Tween

var skipped = false

func _ready():
	# Move the "You fell!" label down
	interpolate_property($Label, "rect_position", 
						Vector2(35, -400), 
						Vector2(35, 500), 
						4, 
						Tween.TRANS_LINEAR, Tween.EASE_OUT)


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
		$Restart.disabled = false
		interpolate_property($Restart, "modulate", 
							Color(1.0, 1.0, 1.0, 0.0), 
							Color(1.0, 1.0, 1.0, 1.0), 
							2, 
							Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		start()
