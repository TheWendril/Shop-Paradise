extends AnimatedSprite2D

@onready var path_follow = get_parent()

const speed: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	play('flying')
	path_follow.loop = true

func _physics_process(delta):
	path_follow.set_progress(path_follow.get_progress() + delta + speed)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
