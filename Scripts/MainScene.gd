extends Node2D

var TBR = load("res://Scenes/ToBeRestarted.tscn")
var CurrentLevel = "ToBeRestarted"

func reloadScene():
	loadScene(CurrentLevel)
	
func loadScene(ToBeLoaded):
	get_node(CurrentLevel).queue_free()
	yield(get_tree(), "idle_frame")
	var TBL = load("res://Scenes/" + ToBeLoaded + ".tscn")
	var TBLinstance = TBL.instance()
	TBLinstance.name = ToBeLoaded
	add_child(TBLinstance)