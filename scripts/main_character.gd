extends CharacterBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
const GRAVITY = 30
const SPEED = 300
const JUMP_HEIGHT = -430
var double_jump = false

@export var device1 : TextureRect
@export var device2 : TextureRect
@export var device3 : TextureRect


func _physics_process(_delta: float):
	if Input.is_action_pressed("restart"):
		global_position.x = 0
		global_position.y = 0
	
	if Input.is_action_pressed("up"): 
		velocity.y += GRAVITY * 0.3 
	else: 
		velocity.y += GRAVITY

	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite2D.flip_h = true
	
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite2D.flip_h = false
	else:
		if not is_on_floor():
			if velocity.x < 0:
				velocity.x += 10
			elif velocity.x > 0:
				velocity.x -= 10
		elif is_on_floor():
			if velocity.x < 0:
				velocity.x += 20
			elif velocity.x > 0:
				velocity.x -= 20
		
	if is_on_floor():
		double_jump = true
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_HEIGHT
	elif Input.is_action_just_released("up") and velocity.y < 0:
		velocity.y *= 0.5
	
	motion = velocity
	move_and_slide()
	pass


func _process(_delta: float) -> void:
	if Input.is_action_pressed("main_menu"):
		get_tree().change_scene_to_file("res://scenes/main_menu.gd")
	
	if GlobalScript.isDevice1InteractedWith:
		device1.visible = false
	if GlobalScript.isDevice2InteractedWith:
		device2.visible = true
	if GlobalScript.isDevice3InteractedWith:
		device3.visible = true
