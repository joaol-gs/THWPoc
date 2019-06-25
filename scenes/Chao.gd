extends ParallaxBackground

var offSet = 0
var d

func _ready():
	set_process(true)
	pass 

func _process(delta):
	d = delta
	set_scroll_offset(Vector2(offSet, 0))
	
func go_right():
	offSet -= 200 * d 