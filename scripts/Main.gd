extends Node2D

var pre_loading = preload("res://scenes/Loading.tscn")
var pre_status = preload("res://scenes/Status.tscn")
var pre_game = preload("res://scenes/Game.tscn")

var next_level = pre_loading.instance()
var next_game = pre_game.instance()

var storesys = load("res://scripts/save.gd").new()

var bestscore
var retomInfo
var teste = "deu"

func _ready():
	if storesys._verify():
		$Menu/btnRetomar.visible = true
	else:
		$Menu/btnRetomar.visible =  false
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
	


func _on_btnStatus_pressed():
	var status_screen = pre_status.instance()
	get_tree().get_root().add_child(status_screen)
	pass


func _on_btnRetomar_pressed():
	var mains = get_tree().get_nodes_in_group("ssroot")
#	for scene in mains:
##		 scene._testando("mueeeu")
#		print(scene.id)
#
	get_tree().get_root().add_child(next_game)
	next_game._retom()
	queue_free()
	pass
	
func _testess():
	print("Ta muendo gostoso")
