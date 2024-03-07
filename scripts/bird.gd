extends Node2D

@onready var anim = $Path2D.PathFollow2D.AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("flying")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
