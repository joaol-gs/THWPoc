extends Area2D

var vel = 400
var dir = Vector2(1, 0)

func _ready():
	pass 

func _process(delta):
	translate(dir * vel * delta)
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	


func _on_Fire_area_entered(area):
	queue_free()
