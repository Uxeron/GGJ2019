extends TouchScreenButton

var disabled = true


func _on_ExitButton_released():
	if disabled: return
	get_tree().quit()
