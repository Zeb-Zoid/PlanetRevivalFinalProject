extends Node2D

var isTouchingPlayer = false
var interactedWith = false

@export var interactLabel : Label
@export var popup1 : TextureRect
@export var blueGlow : TextureRect
@export var backgroundRect : ColorRect

func _ready():
	interactLabel.visible = false
	popup1.visible = false
	backgroundRect.visible = false
	blueGlow.visible = false

func _process(_delta: float) -> void:
	if isTouchingPlayer:
		if interactedWith == false:
			interactLabel.visible = true
			if Input.is_action_pressed("interact"):
				interactedWith = true
				interactLabel.visible = false
				GlobalScript.isDevice1InteractedWith = true
				blueGlow.visible = true
				
				ShowPopup()
				
				print("touched")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		isTouchingPlayer = true
	pass # Replace with function body.


func _on_area_2d_area_exited(_area: Area2D) -> void:
	isTouchingPlayer = false
	interactLabel.visible = false
	pass # Replace with function body.

func ShowPopup():
	popup1.visible = true
	backgroundRect.visible = true
	await get_tree().create_timer(5.0).timeout
	popup1.visible = false
	backgroundRect.visible = false
