extends Node2D

var time: float = 0
var current_minute: float = -1.0

@export var gradient: GradientTexture1D
@export var time_speed: float = 0.02

const minutes_per_day = 1440
const minutes_per_hour = 60
const hours_per_day = 24
const in_game_minutes = (2 * PI) / minutes_per_day 

signal time_tick(day: int, hour: int, minute: int)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta * time_speed
	var value = (sin(time - PI / 2) + 1.0) / 2.0
	self.color = gradient.gradient.sample(value)
	_recalculate_time()

func _recalculate_time() -> void: 
	var total_minutes = int(time / in_game_minutes)
	var day = int(total_minutes / minutes_per_day)
	var current_day_minutes = total_minutes % minutes_per_day
	var hour = int(current_day_minutes / minutes_per_hour)
	var minute = int(current_day_minutes % minutes_per_hour)

	if minute != current_minute:
		current_minute = minute
		time_tick.emit(day + 1, hour, minute)
