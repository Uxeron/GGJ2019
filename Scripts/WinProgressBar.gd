extends TextureProgress

signal winLevel

var house
var spdThreshold = 0.05
var winThreshold = 0.075
var winTimeDefault = 5.0
var winTimeCounting
var waiting = true

func _ready():
	house = get_parent().get_node("Home")
	winTimeCounting = winTimeDefault

func _physics_process(delta):
	if waiting: return
	
	value = (1.0 - (winTimeCounting / winTimeDefault)) * 100.0
	if abs(house.rotSpeed) < spdThreshold and house.rotation < winThreshold and house.rotation > -winThreshold:
		winTimeCounting -= delta
		if winTimeCounting <= 0:
			emit_signal("winLevel")
	else:
		winTimeCounting = winTimeDefault

func _on_Timer_timeout():
	waiting = false
