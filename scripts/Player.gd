extends KinematicBody2D

const VELX = 500
const GRAVITY = 1500
const JUMP_SPEED = 600

export var life = 100
export var energy = 10
export var lifes = 2
export var moving = false

var velocity = Vector2(0, 0)
var jump = false
var bodie = 1 setget set_sprite
var anime=""
var pre_fire = preload("res://scenes/Fire.tscn")
var new_anim = "iddle"
var walk = false
var store =  load("res://scripts/save.gd").new()

var anim = [
	"res://img/sprites/run.png",
	"res://img/sprites/iddle.png"
	] 

func _ready():
	set_physics_process(true)
	pass 
	
func _draw():
	$Sprite.texture = load(anim[bodie])

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		go_right()
	if Input.is_action_pressed("ui_up"):
		jump = true
		
	if Input.is_action_just_pressed("ui_shot"):
		if moving:
			if get_tree().get_nodes_in_group("fires").size() < 4:
				var fire = pre_fire.instance()
				fire.global_position = $muzzle.global_position
				get_parent().add_child(fire)
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if new_anim != anime:
		anime = new_anim
		$"Run-animation".play(anime)
	
	if is_on_floor():
		if jump:
			velocity.y = -JUMP_SPEED
	jump = false
	new_anim = "iddle"

func set_sprite(val):
	bodie = val
	if Engine.editor_hint:
		update()

func _on_Area2D_area_entered(area):
	life -= 10
func _on_BtnLeft_pressed():
	walk = true
func _on_BtnUP_pressed():
	jump = true
	
func go_right():
	moving = true
	new_anim = "run"
	get_node( "Sprite" ).set_flip_h( false )

func _on_BtnFire_pressed():
	if moving:
			if get_tree().get_nodes_in_group("fires").size() < 2:
				var fire = pre_fire.instance()
				fire.global_position = $muzzle.global_position
				get_parent().add_child(fire)

