extends Node2D

var pre_loading = preload("res://scenes/Loading.tscn")
var pre_status = preload("res://scenes/Status.tscn")
var next_level = pre_loading.instance()
var storesys = load("res://scripts/save.gd").new()
var bestscore

func _ready():
	set_process(false)
	bestscore = String (storesys._load())
	get_node("Menu/Pont").text = bestscore
	pass 

func _on_TouchScreenButton_pressed():
	var status_screen = pre_status.instance()
	get_tree().get_root().add_child(status_screen)
	pass
	
func _on_btnplay_pressed():
#	get_tree().get_root().add_child(next_level)
	get_tree().change_scene("res://scenes/Loading.tscn")
	queue_free()
	
