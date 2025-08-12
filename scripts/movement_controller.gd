extends Node

#@onready var rootTip: Node = $".."
#
#var windowWidth: float = DisplayServer.window_get_size().x
#var windowHeight: float = DisplayServer.window_get_size().y
#
#func _ready() -> void:
	##rootTip.velocity = Vector2(windowWidth / 10, 0)
	#rootTip.velocity = Vector2(100, 0)
	#pass
#
#
#func _physics_process(delta: float) -> void:
	#rootTip.move_and_slide()
	#pass
#
#
#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("ui_up") && rootTip.rotation_degrees != -45:
		#rootTip.rotation_degrees -= 45
		#rootTip.velocity -= Vector2(0, 100)
	#if event.is_action_pressed("ui_down") && rootTip.rotation_degrees != 45:
		#rootTip.rotation_degrees += 45
		#rootTip.velocity += Vector2(0, 100)
