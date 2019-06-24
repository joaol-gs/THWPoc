extends Node2D

var pre_play = preload("res://scenes/Game.tscn")
var next_level = pre_play.instance()

func _ready():
	pass 

#func _process(delta):
#	pass

func _on_Start_pressed():
	$Panel.visible = false
	get_tree().get_root().add_child(next_level)


func _on_TouchScreenButton_pressed():
#	$.visible = false
	get_tree().get_root().add_child(next_level)
