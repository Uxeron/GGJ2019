extends TextureProgress

signal winLevel

var house
var winThreshold = 0.05
var winTimeDefault = 5.0
var winTimeCounting

func _ready():
	house = get_parent().get_node("Home")
	winTimeCounting = winTimeDefault

func _physics_process(delta):
	value = (1.0 - (winTimeCounting / winTimeDefault)) * 100.0
	if house.rotation < winThreshold and house.rotation > -winThreshold:
		winTimeCounting -= delta
		if winTimeCounting <= 0:
			emit_signal("winLevel")
	else:
		winTimeCounting = winTimeDefault