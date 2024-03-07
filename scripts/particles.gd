extends Node2D

const Enums = preload("res://scripts/season.gd")
const Season = Enums.Season


@onready var rain = $rain
@onready var snow = $snow
@onready var falling_leaves = $falling_leaves


var rain_probability: int = 50
var snow_probability: int = 0
var falling_leaves_probability: int = 0


const rain_range_verification: int = 6
const snow_range_verification: int = 6
const falling_leaves_verification: int = 6
var last_rain_verification: int = -1
var last_snow_verification: int = -1
var last_falling_leaves_verification: int = -1

var current_day: int = 0
var current_hour: int = 1
var current_minute: int = 0

var is_raining: bool
var is_snowing: bool
var is_falling: bool
signal weather(is_raining: bool, is_snowing: bool, is_falling: bool)

var current_season: Season = Season.summer
var last_day_verification: int  = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if current_day != last_day_verification:
		last_day_verification = current_day
		calculate_probabilities()	
	
	if current_hour % rain_range_verification == 0 and current_hour != last_rain_verification:
		
		last_rain_verification = current_hour
		var test_factor = randi() % 101
		
		if test_factor < rain_probability:
			init_rain(true)
		else: 
			init_rain(false)
		weather.emit(is_raining, is_snowing, is_falling)

	if current_hour % snow_range_verification == 0 and current_hour != last_snow_verification:
		
		last_snow_verification = current_hour
		var test_factor = randi() % 101
		
		if test_factor < snow_probability:
			init_snow(true)
		else: 
			init_snow(false)
		weather.emit(is_raining, is_snowing, is_falling)

	if current_hour % falling_leaves_verification == 0 and current_hour != last_falling_leaves_verification:
		
		last_falling_leaves_verification = current_hour
		var test_factor = randi() % 101
		
		if test_factor < falling_leaves_probability:
			init_falling_leaves(true)
		else: 
			init_falling_leaves(false)
		weather.emit(is_raining, is_snowing, is_falling)

func init_falling_leaves(init: bool):
	falling_leaves.emitting = init
	is_falling = init

func init_rain(init: bool):
	rain.emitting = init 
	is_raining = init

func init_snow(init: bool):
	snow.emitting = init 
	is_snowing = init

func _on_node_2d_season_update(season):
	current_season = season
	calculate_probabilities()	

func _on_daynight_time_tick(day, hour, minute):
	current_day = day
	current_hour = hour
	current_minute = minute

func calculate_probabilities():
	
	if current_season == Season.summer:
		rain_probability = (randi() % 50) + 30
		snow_probability = 0
		falling_leaves_probability = 0
	if current_season == Season.winter:
		rain_probability = 0
		snow_probability = (randi() % 30) + 50
		falling_leaves_probability = 0
	if current_season == Season.autumn:
		falling_leaves_probability = (randi() % 50) + 50
		rain_probability = (randi() % 20) + 20
		snow_probability = 0
	if current_season == Season.spring:
		rain_probability = (randi() % 30) + 20
		snow_probability = 0
		falling_leaves_probability = 0
