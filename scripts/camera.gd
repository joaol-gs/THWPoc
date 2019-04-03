extends Camera2D

var velocity = Vector2(0, 0)

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_position_in_parent();
	velocity.x += 7 
	translate(velocity)
	pass
