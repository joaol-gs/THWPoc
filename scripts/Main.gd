extends Node2D

var pre_play = preload("res://scenes/Game.tscn")
var pre_status = preload("res://scenes/Status.tscn")
var next_level = pre_play.instance()
var storesys = load("res://scripts/save.gd").new()
var bestscore

func _ready():
	set_process(false)
	bestscore = String (storesys._load())
	get_node("Menu/Pont").text = bestscore
	pass 
	
#func _process(delta):
#	print("começou")
#	if next_level.lp == 0:
#		next_level.queue_free()
#	pass

func _on_TouchScreenButton_pressed():
	var status_screen = pre_status.instance()
	get_tree().get_root().add_child(status_screen)
	pass

#func _esconde():
#	$Menu/btnStart.visible = false
#	$Menu/Pont.visible = false
#	$Menu/Label.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer2.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer3.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer4.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer5.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer6.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer7.visible = false
#	$Menu/ParallaxBackground/ParallaxLayer8.visible = false

func _on_btnplay_pressed():
#	_esconde()
	get_tree().get_root().add_child(next_level)
	queue_free()
