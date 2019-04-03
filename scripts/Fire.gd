extends Area2D

const MAXDIST= 280

var speed = 650
var dir = Vector2(1 , 0) 
var live = true


onready var init_pos = global_position 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	if live:
		if global_position.distance_to(init_pos) >= MAXDIST:
#			destructBullet()
			pass
	translate(dir * speed * delta)

