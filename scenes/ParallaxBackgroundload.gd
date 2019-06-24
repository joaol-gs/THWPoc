extends ParallaxBackground

var offSet = 0

func _ready():
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offSet -= 200 * delta 
	set_scroll_offset(Vector2(offSet, 0))
	pass
