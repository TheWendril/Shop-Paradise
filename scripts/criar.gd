extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_pressed():
	
	var scene = load('res://scenes/stores/clothes.tscn')
	var clothes_store = scene.instantiate()
	
	disabled = true
	
	clothes_store.scale.x = 0.25
	clothes_store.scale.y = 0.25
	
	clothes_store.position.x = 882
	clothes_store.ground = 508
	
	var game = get_parent().get_parent()
	game.add_child(clothes_store)

