extends Node2D

@onready var ground: Node = $Ground
@onready var rootTip: Node = $RootTip
@onready var camera: Node = $RootTip/RootCamera

var windowWidth: float = DisplayServer.window_get_size().x
var windowHeight: float = DisplayServer.window_get_size().y


func _ready() -> void:
	#get_window().size = Vector2(640, 360)
	ground.size = Vector2(windowWidth, windowHeight)
	print(ground.size)
	rootTip.global_position = Vector2(windowWidth / 2, windowHeight / 2)
	#camera.limit_left = windowWidth - windowWidth
	#camera.limit_right = windowWidth
	#camera.limit_top = windowHeight - windowHeight
	#camera.limit_bottom = windowHeight
	pass


func _process(delta: float) -> void:
	#get_window().size = Vector2(640, 360)
	pass
