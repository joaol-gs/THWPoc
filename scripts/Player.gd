extends KinematicBody2D

const VELX = 500
const GRAVITY = 1500
const JUMP_SPEED = 500

var velocity = Vector2(0, 0)
var jump = false
var bodie = 1 setget set_sprite
var anime=""
var pre_fire = preload("res://scenes/Fire.tscn")

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
	print(global_position)
	var new_anim = "iddle"
	
	velocity.y += GRAVITY * delta
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		new_anim = "run"
#		velocity.x = VELX
		get_node( "Sprite" ).set_flip_h( false )
		
	if Input.is_action_pressed("ui_up"):
		
		
		jump = true
		
	if Input.is_action_pressed("ui_left"):
		new_anim = "run"
#		velocity.x -= VELX
		get_node( "Sprite" ).set_flip_h( true )
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if new_anim != anime:
		anime = new_anim
		$"Run-animation".play(anime)
	
	if is_on_floor():
		print("true")
		if jump:
			velocity.y = -JUMP_SPEED

	else:
		print("false")
	jump = false
func set_sprite(val):
	bodie = val
	if Engine.editor_hint:
		update()