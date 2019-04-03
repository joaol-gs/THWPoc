extends KinematicBody2D

const VELX = 500
const GRAVITY = 1500
const JUMP_SPEED = 500

var velocity = Vector2(0, 0)
var jump = false
var bodie = 1 setget set_sprite
var anime=""

var anim = [
	"res://img/sprites/run.png",
	"res://img/sprites/iddle.png"
	] 

func _ready():
	pass 
	
func _draw():
	$Sprite.texture = load(anim[bodie])

func _physics_process(delta):
	
	var new_anim = "iddle"
	
	velocity.y += GRAVITY * delta
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		new_anim = "run"
		velocity.x = VELX
		get_node( "Sprite" ).set_flip_h( false )
	if Input.is_action_pressed("ui_left"):
		new_anim = "run"
		get_node( "Sprite" ).set_flip_h( true )
	
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if new_anim != anime:
		anime = new_anim
		$"Run-animation".play(anime)
	
	if is_on_floor():
		if jump:
			velocity.y = -JUMP_SPEED
			jump = false
	else:
		print("buneco is over of the floor")
	
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			jump = true
func set_sprite(val):
	bodie = val
	if Engine.editor_hint:
		update()
	pass