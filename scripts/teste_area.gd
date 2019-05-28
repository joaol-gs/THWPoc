extends Node2D

var pre_lexusf = preload("res://scenes/LexusF.tscn")
var lp = 0
var le = 0
var score = 0

var gameStart = true

func _ready():
	$Timer.start()
	$scoreTime.start()
	pass

func _process(delta):
	
	print(String(get_node("stats/PBLife").value) + ", " +String(lp))
	
	lp = $Player.life
	le = $Player.energy
	_animaBarra()
	
	if lp == -10:
		get_tree().paused = true
		$DeadMenu/Dead/Label.set_text(String(score) + " pontos")
		$DeadMenu.visible = true

func _on_Timer_timeout():
	var lexusF = pre_lexusf.instance()
	lexusF.global_position = $Spawn.global_position
	get_parent().add_child(lexusF)
	$Timer.start()
	pass 

func _animaBarra():
	if get_node("stats/PBLife").value > lp:
		get_node("stats/PBLife").value -= 1
	elif get_node("stats/PBLife").value < lp:
		get_node("stats/PBLife").value += 1
	
	if get_node("stats/PBEnergy").value > le:
		get_node("stats/PBEnergy").value -= 0.2
	elif get_node("stats/PBEnergy").value < le:
		get_node("stats/PBEnergy").value += 1

func _on_scoreTime_timeout():
	score += 2
	$Panel/score.set_text(String(score))
	$scoreTime.start()


func _on_Button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
