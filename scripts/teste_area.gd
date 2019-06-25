extends Node2D

var pre_lexusf = preload("res://scenes/LexusF.tscn")
var lp = 0
var le = 0
var score = 0

var gameStart = true

func _ready():
	$Aviso/avisoTimer.start()
	$Timer.start()
	$scoreTime.start()
	setVidas()
	pass

func _process(delta):
	lp = $Player.life
	le = $Player.energy
	_animaBarra()
	if lp < 0:
		if $Player.lifes == 1:
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
	get_tree().paused = false
	get_tree().reload_current_scene()

func deadMen():
	var enemies = get_tree().get_nodes_in_group("quants")
	for enemy in enemies:
		 enemy.queue_free()
	get_tree().paused = true
	$DeadMenu/Dead/Label.set_text(String(score) + " pontos")
	$DeadMenu.visible = true

func setVidas() :
	$Panel/lifes.set_text(String($Player.lifes))

func _on_avisoTimer_timeout():
	$Aviso.visible = false

func _on_BtnLeft_pressed():
	print("teste")
	
