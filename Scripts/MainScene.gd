extends Node2D

var TBR = load("res://Scenes/ToBeRestarted.tscn")

func reloadScene():
	$ToBeRestarted.queue_free()
	yield(get_tree(),"idle_frame")
	var TBRinstance = TBR.instance()
	TBRinstance.name = "ToBeRestarted"
	add_child(TBRinstance)