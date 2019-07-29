extends Node2D

var pre_play = preload("res://scenes/Game.tscn")
var next_level = pre_play.instance()

func _ready():
	pass 

func _on_TouchScreenButton_pressed():
	_esconde()
	get_tree().get_root().add_child(next_level)

func _esconde():
	$Menu/btnStart.visible = false
	$Menu/Pont.visible = false
	$Menu/Label.visible = false
	$Menu/ParallaxBackground/ParallaxLayer.visible = false
	$Menu/ParallaxBackground/ParallaxLayer2.visible = false
	$Menu/ParallaxBackground/ParallaxLayer3.visible = false
	$Menu/ParallaxBackground/ParallaxLayer4.visible = false
	$Menu/ParallaxBackground/ParallaxLayer5.visible = false
	$Menu/ParallaxBackground/ParallaxLayer6.visible = false
	$Menu/ParallaxBackground/ParallaxLayer7.visible = false
	$Menu/ParallaxBackground/ParallaxLayer8.visible = false