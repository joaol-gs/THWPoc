extends Node2D

var retomg = preload("res://scenes/Game.tscn")
var reload = retomg.instance()

func _ready():
	set_process(true)
	pass 

func _process(delta):
	if $ProgressBar.value == 100:
		get_tree().change_scene("res://scenes/Game.tscn")
		queue_free()
	pass

func _on_Timer_timeout():
	$ProgressBar.value += 1 
	$Timer.start()
	pass
