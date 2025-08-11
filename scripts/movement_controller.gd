extends Node

@onready var rootTip: Node = $".."


func _ready() -> void:
	rootTip.velocity = Vector2(100, 0)


func _physics_process(delta: float) -> void:
	rootTip.move_and_slide()
