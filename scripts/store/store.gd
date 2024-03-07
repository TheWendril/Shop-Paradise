extends Node2D

@export var ground: int 
@export var height = 74

var is_fixed: bool = false
const min_ground = 508
var stores_inside: int = 0

func _process(delta):
	
	if is_fixed == false:

		if down_link_1 == true and down_link_2 == true:
			down_link = true
		else: 
			down_link = false
		
		if down_link == false: 
			modulate = Color("#c21313")
		else:
			modulate = Color("#ffffff")
			
		modulate = Color(modulate, 0.5)
		position.y = ground
		position.x = get_global_mouse_position()[0]
		
		check_ground()
		
		
func _input(event):
	if event is InputEventMouseButton and is_fixed == false:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT and down_link == true:
			is_fixed = true 
			modulate = Color("#ffffff", 1.0)


func _on_area_2d_area_entered(area):

	if area.name == 'Shape' and is_fixed == false:
		ground -= height
		print('entrou numa loja!!!!!!!!!!!!')
	
var down_link_1: bool = false
var down_link_2: bool = false
@export var down_link: bool = false

func _on_down_link_1_area_entered(area):
	if area.name == 'ground_area' or area.name == 'Shape':
		down_link_1 = true
		print('dl1 entrou em: ', area.name)

func _on_down_link_2_area_entered(area):
	if area.name == 'ground_area' or area.name == 'Shape':
		down_link_2 = true	
		print('dl2 entrou em: ', area.name)

func _on_down_link_1_area_exited(area):
	down_link_1 = false
	print('dl1 saiu em: ', area.name)

	
func _on_down_link_2_area_exited(area):
	down_link_2 = false
	print('dl2 saiu em: ', area.name)

	
func check_ground():
	if down_link_1 == false and down_link_2 == false:
		if ground + height <= 508:
			ground += height
		else:
			ground = min_ground
	
