extends Node2D


@onready var light = $PointLight2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_daynight_time_tick(day, hour, minute):
	if hour > 18 or hour < 6:
		light.enabled = true
	else:
		light.enabled = false
		
