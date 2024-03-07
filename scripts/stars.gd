extends Sprite2D

var is_raining: bool
var is_snowing: bool
var is_falling: bool

var current_day: int
var current_hour: int
var current_minute: int

var last_verified_hour: int = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if current_hour != last_verified_hour:
		
		if (current_hour <= 7 or current_hour >= 18) and is_snowing == false:
			visible = true
			modulate = Color("#ffffff")
		else:
			visible = false
			
		if current_hour == 6:
			modulate = Color("#ffff40")
		
		if current_hour == 18:
			modulate = Color("#ffff40")
			

func _on_daynight_time_tick(day, hour, minute):
	current_day = day
	current_hour = hour
	current_minute = minute
	
func _on_particles_weather(is_raining, is_snowing, is_falling):
	is_raining = is_raining
	is_snowing = is_snowing
	is_falling = is_falling
