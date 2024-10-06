extends Area2D

class_name InteractionArea

@export var actionName: String = "interact"

var interact: Callable = func():
	pass


func _on_body_entered(body):
	InteractionManager.RegisterArea(self)


func _on_body_shape_exited(body):
	InteractionManager.UnRegisterArea(self)
