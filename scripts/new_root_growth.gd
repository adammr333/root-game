extends Node2D

@onready var rootTip = get_node("/root/Game/RootTip")


func _ready() -> void:
	global_position = rootTip.global_position
	rotation_degrees = rootTip.rotation_degrees
