extends ParallaxBackground

var offSet = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		offSet -= 200 * delta 
	if Input.is_action_pressed("ui_left"):
		offSet += 200 * delta 
	set_scroll_offset(Vector2(offSet, 0))
	pass
