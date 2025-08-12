extends CharacterBody2D

@onready var rootTipLength: int = $RootSprite.size.x
@onready var growPoint: Node = $GrowPoint

var lastPosition: Vector2
var totalChange: Vector2 = Vector2(0.0, 0.0)
var rootSpriteGrowth: Resource = load("res://scenes/new_root_growth.tscn")


func _ready() -> void:
	lastPosition = position
	pass


func _process(delta: float) -> void:
	var currentPosition: Vector2 = position
	var deltaPosition: Vector2 = currentPosition - lastPosition
	#print("Change in position: " + str(deltaPosition))
	lastPosition = currentPosition
	totalChange += deltaPosition
	#print("Total change: " + str(totalChange))
	if totalChange.x + totalChange.y > 200:
		print("The Root Grows.")
		totalChange = Vector2(0.0, 0.0)
		var newRootGrowth = rootSpriteGrowth.instantiate()
		add_child(newRootGrowth)
		var newRootGrowthIndex: int = get_child_count() - 1
		get_child(newRootGrowthIndex).global_position = growPoint.global_position
		growPoint.global_position = get_child(newRootGrowthIndex).get_node("GrowPoint").global_position
	pass
