extends Camera2D

@export var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	global_position.x = player.global_position.x + 200
