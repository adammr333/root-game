extends Node2D

@onready var ground: Node = $Ground
@onready var rootTip: Node = $RootTip
@onready var camera: Node = $RootTip/RootCamera

var windowWidth: float = DisplayServer.window_get_size().x
var windowHeight: float = DisplayServer.window_get_size().y
var rootSpriteGrowth: Resource = load("res://scenes/new_root_growth.tscn")
var newRootGrowthIndex: int = get_child_count() - 1


func _ready() -> void:
	#get_window().size = Vector2(640, 360)
	ground.size = Vector2(windowWidth, windowHeight)
	print(ground.size)
	rootTip.global_position = Vector2(windowWidth / 2, windowHeight / 2)
	#camera.limit_left = windowWidth - windowWidth
	#camera.limit_right = windowWidth
	#camera.limit_top = windowHeight - windowHeight
	#camera.limit_bottom = windowHeight
	print_tree()
	pass


func _process(delta: float) -> void:
	#get_window().size = Vector2(640, 360)
	pass


func grow_root():
	var newRootGrowth = rootSpriteGrowth.instantiate()
	#call_deferred("add_child", newRootGrowth)
	add_child(newRootGrowth)
	#print("Grow Root")
	pass
