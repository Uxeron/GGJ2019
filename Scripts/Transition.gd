extends TextureRect

var firedOnce = false

export var transitionSpeed = 0.6

func transition():
	if $Tween.is_active(): return
	$Tween.interpolate_property(get_material(), "shader_param/width", 
								0.0, 
								1.0, 
								transitionSpeed / 2.0,
								Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	$Tween.start()
	


func _on_Tween_tween_completed(object, key):
	if !firedOnce:
		firedOnce = true
		get_node("/root/MainScene").loadScene("ToBeRestarted2")
		$Tween.interpolate_property(get_material(), "shader_param/width", 
									1.0, 
									0.0, 
									transitionSpeed / 2.0,
									Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
		$Tween.start()
	else:
		firedOnce = false
		$Tween.stop_all()
