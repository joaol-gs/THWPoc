extends Node2D

var pre_lexusf = preload("res://scenes/LexusF.tscn")
var lp = 0
var le = 0
var score = 0
var storesys = load("res://scripts/save.gd").new()
var gameStart = true
var retom = false

func _ready():
	$Aviso/avisoTimer.start()
	$Timer.start()
	$scoreTime.start()
	$DeadMenu.visible = false
	$PauseMenu.visible = false
	setVidas()
	pass

func _process(delta):
	lp = $Player.life
	le = $Player.energy
	_animaBarra()
	if lp < 0:
		if $Player.lifes == 1:
			if score > int(storesys._load()):
				storesys._save(score)
				storesys._savestats(le, score, $Timer.wait_time)
			deadMen()
		else:
			$Player.life = 100
			$Player.lifes -= 1
			setVidas()
	if le == 100 and $Player.lifes >= 2:
		$BtnEspecial.visible = true
	else:
		$BtnEspecial.visible = false
		
#===============================Movimentação========================================
	#Movimentação por touch
	if $BtnLeft.is_pressed():
		$Player.go_right()
		$ParallaxBackground.go_right()
		$Chao.go_right()
	else:
		$Player.moving = false
		
	#Movimentoação por teclado
	if Input.is_action_pressed("ui_right"):
		$ParallaxBackground.go_right()
		$Player.go_right()
		$Chao.go_right()
	if Input.is_action_pressed("ui_up"):
		$Player.jump = true

func _on_Timer_timeout():
	if $Player.moving :
		print($Timer.wait_time)
		var lexusF = pre_lexusf.instance()
		var spw = randi()%2+1
		if spw == 1:
			lexusF.global_position = $Spawn.global_position
		elif spw == 2:
			lexusF.global_position = $Spawn2.global_position
		
		get_parent().add_child(lexusF)
		lexusF.add_to_group("quants")
		if $Timer.wait_time > .3:
			$Timer.wait_time -= .1
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
	if $Player.moving :
		score += 2
		$Panel/score.set_text(String(score))
		$scoreTime.start()

func _on_Button_pressed():
#	var pre_loading = preload("res://scenes/Game.tscn")
#	var next_level = pre_loading.instance()
#	get_tree().get_root().add_child(next_level)
	get_tree().paused = false
#	get_tree().change_scene("res://scenes/Main.tscn")
	get_tree().reload_current_scene()
	queue_free()

func deadMen():
	_killall()
	$DeadMenu.visible = true
	get_tree().paused = true
	$DeadMenu/Dead/Label.set_text(String(score) + " pontos")

func setVidas() :
	$Panel/lifes.set_text(String($Player.lifes))

func _on_avisoTimer_timeout():
	$Aviso.visible = false

func _on_BtnLeft_pressed():
	print("teste")

func _killall():
	var enemies = get_tree().get_nodes_in_group("quants")
	for enemy in enemies:
		 enemy.queue_free()
	pass

func _addPoint(var point):
	print(point) 


func _on_btnReload_pressed():
	get_tree().paused = false
#	get_tree().reload_current_scene()
	get_tree().change_scene("res://scenes/Game.tscn")
	queue_free()


func _on_btnMenu_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
	get_tree().paused = false
	queue_free()
	
func _retom():
	var info = storesys._getRetom()
	$Player.energy = info['energy']
	$Player.lifes = 1
	get_tree().get_root().print_tree()
	print("Energy of player is now: " + String($Player.energy))
	$Timer.wait_time = info['spawnt']
	print("Spawn time is now: " + String($Timer.wait_time))
	score = info['score']
	print("The score is now: " + String(score))
	$Panel/score.text = String(score)
	$Panel/lifes.text = String($Player.lifes)
	$Aviso/Label2.text = "Prepare-se!"


func _on_btnPause_pressed():
	$btnPause.visible = false
	$PauseMenu.visible = true
	get_tree().paused = true


func _on_btnContinue_pressed():
	$btnPause.visible = true
	$PauseMenu.visible = false
	get_tree().paused = false


func _on_btnExit_pressed():
	get_tree().paused = false
	_killall()
	get_tree().change_scene("res://scenes/Main.tscn")
	queue_free()
