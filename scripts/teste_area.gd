extends Node2D

var pre_lexusf = preload("res://scenes/LexusF.tscn")
var lp = 0
var le = 0

var gameStart = true

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Timer.start()
	pass # Replace with function body.

func _process(delta):
	lp = $Player.life
	le = $Player.energy
	get_node("stats/PBLife").value = lp
	get_node("stats/PBEnergy").value = le
	pass


func _on_Timer_timeout():
#	print("ta muendo")
#	var lexusF = pre_lexusf.instance()
#	lexusF.global_position = $Spawn.global_position
#	get_parent().add_child(lexusF)
#	$Timer.start()
	pass