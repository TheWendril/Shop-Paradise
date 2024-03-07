extends Control

const Enums = preload("res://scripts/season.gd")
const Season = Enums.Season

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_daynight_time_tick(day, hour, minute):
	var label = get_node('topbar/Clock')
	var day_label = get_node('topbar/DayLabel')
	var str_hour = str(hour)
	var str_minute = str(minute)
	var str_day = str(day)
	
	if hour < 10:
		str_hour = '0' + str(hour)
	if minute < 10:
		str_minute = '0' + str(minute)
	if day < 10:
		str_day = '0' + str(day)
	
	label.text = str_hour + ':' + str_minute
	day_label.text = 'Day: ' + str_day




func _on_node_2d_season_update(season):
	var season_label = get_node('topbar/SeasonLabel')
	var season_icon = get_node('topbar/Season')
	
	if season == Season.winter:
		season_label.text = 'winter'
		season_icon.texture = load('res://themes/season/winter.png')
		
	if season == Season.summer:
		season_label.text = 'summer'
		season_icon.texture = load('res://themes/season/summer.webp')

	if season == Season.autumn:
		season_label.text = 'autumn'
		season_icon.texture = load('res://themes/season/autumn.png')
		
	if season == Season.spring:
		season_label.text = 'spring'
		season_icon.texture = load('res://themes/season/spring.png')
	


func _on_speed_item_selected(index):
	var daynight = get_parent().get_parent().get_node('daynight')
	
	if index == 0:
		pause_game()
	elif index == 1:
		daynight.time_speed = 0.02
		unpause_game()
	elif index == 2:
		daynight.time_speed = 0.04
		unpause_game()
	elif index == 3:
		daynight.time_speed = 0.06
		unpause_game()


func pause_game():
	var node2d = get_parent().get_parent()
	var childrens = node2d.get_children()
	
	for child in childrens:
		if child.name != 'Camera2D':
			child.set_process(false)
			child.set_physics_process(false)
	
func unpause_game():
	var node2d = get_parent().get_parent()
	var childrens = node2d.get_children()
	
	for child in childrens:
		child.set_process(true)
	
