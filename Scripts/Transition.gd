extends TextureRect

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func transition(tex, position):
	var imgtex = ImageTexture.new()
	var imgdata = tex.get_data()
	imgdata.flip_y()
	imgtex.create_from_image(imgdata)
	texture = imgtex
	rect_size = imgtex.get_size()
	get_material().set_shader_param("middlePos", position / Vector2(720, 1280))
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	get_node("/root/MainScene").reloadScene()
	
	$Tween.interpolate_property(get_material(), "shader_param/width", 
									0.0, 
									3.0, 
									2,
									Tween.TRANS_LINEAR, Tween.EASE_OUT)
	
	$Tween.start()
	
