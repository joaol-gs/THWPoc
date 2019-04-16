extends Area2D

var vel = 300
var dir = Vector2(1, 0)

func _ready():
	pass 

func _process(delta):
	translate(dir * vel * delta)
	pass

func _on_VisibilityNotifier2D_screen_exited():
	print("saiu")
	queue_free()
	
