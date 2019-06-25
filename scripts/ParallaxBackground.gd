extends ParallaxBackground

var offSet = 0
var d

func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	d = delta
	set_scroll_offset(Vector2(offSet, 0))
	pass
	
func go_right():
	offSet -= 200 * d 
