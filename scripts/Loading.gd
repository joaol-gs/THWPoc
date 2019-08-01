extends Node2D

var pre_play  =  preload("res://scenes/Game.tscn")
var next_level = pre_play.instance()

func _ready():
	pass 

func _process(delta):
	if $ProgressBar.value == 100:
		get_tree().get_root().add_child(next_level)
		queue_free()
	pass


func _on_Timer_timeout():
	$ProgressBar.value += 1 
	$Timer.start()
	pass
