extends Node2D

@export var days_per_season = 2

const Enums = preload("res://scripts/season.gd")
const Season = Enums.Season

signal season_update(season: Season)

@onready var canvasModulate = $daynight
var current_day = 0
var modified_day = 0
var current_hour = 0
var current_minute = 0
var season: Season = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	

	if (current_day % days_per_season) == 0 and current_day != modified_day:
		if season == 4:
			season = 1
		else:
			season += 1
		modified_day = current_day
		change_season()

func _on_canvas_modulate_time_tick(day, hour, minute):
	current_day = day
	current_hour = hour 
	current_minute = minute


func change_season():
	
	if season == Season.summer:
		canvasModulate.gradient = load("res://assets/DayCycleGradients/summer.tres")
		print('summer')
	if season == Season.winter:
		canvasModulate.gradient = load("res://assets/DayCycleGradients/winter.tres")
		print('winter')
	if season == Season.autumn:
		canvasModulate.gradient = load("res://assets/DayCycleGradients/autumn.tres")
		print('autumn')
	if season == Season.spring:
		canvasModulate.gradient = load("res://assets/DayCycleGradients/spring.tres")
		print('spring')		
		
	season_update.emit(season)
	canvasModulate.queue_redraw()



