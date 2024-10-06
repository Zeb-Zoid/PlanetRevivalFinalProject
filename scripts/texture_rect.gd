extends TextureRect

@export var camera : Camera2D
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	global_position.x = camera.global_position.x - 700
