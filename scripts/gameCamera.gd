extends Camera2D

const min_zoom = 1.0
const max_zoom = 1.2
const zoom_degree = 0.1
var _target_zoom: float = 1.0

func zoom_in():
	_target_zoom = max(_target_zoom - zoom_degree, min_zoom)
	set_physics_process(true)
	
func zoom_out():
	_target_zoom = max(_target_zoom + zoom_degree, max_zoom)
	set_physics_process(true)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zoom = lerp(zoom, _target_zoom * Vector2.ONE, 8.0 * delta)
	set_physics_process(not is_equal_approx(zoom.x, _target_zoom))

func _input(event):
	
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_RIGHT:	
			if position.y - event.relative[1] <= limit_bottom and position.y - event.relative[1] >= limit_top:
				position.y -= event.relative[1]			
			if position.x - event.relative[0] >= limit_left and position.x - event.relative[0] <= limit_right:
				position.x -= event.relative[0]


func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				zoom_out()
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				zoom_in() 

