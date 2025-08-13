extends Node2D

@onready var ground: Node = $Ground
@onready var rootTip: Node = $RootTip
@onready var camera: Node = $RootTip/RootCamera

var windowWidth: float = DisplayServer.window_get_size().x
var windowHeight: float = DisplayServer.window_get_size().y
var rootSpriteGrowth: Resource = load("res://scenes/new_root_growth.tscn")
var newRootGrowthIndex: int = get_child_count() - 1
var previousRootSprite: String = "Straight"
var newRootSprite: String = "Straight"
var spriteChoice: int


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
	match previousRootSprite:
		"Straight":
			match newRootSprite:
				"Straight":
					spriteChoice = 0
					#print("Straight")
				"Diagonal Up":
					spriteChoice = 3
					#print("Straight Diagonal Up")
				"Diagonal Down":
					spriteChoice = 4
					#print("Straight Diagonal Down")
		"Diagonal Up":
			match newRootSprite:
				"Straight":
					spriteChoice = 5
					#print("Diagonal Up Straight")
				"Diagonal Up":
					spriteChoice = 1
					#print("Diagonal Up")
				"Diagonal Down":
					spriteChoice = 7
					#print("Diagonal Up Diagonal Down")
		"Diagonal Down":
			match newRootSprite:
				"Straight":
					spriteChoice = 6
					#print("Diagonal Down Straight")
				"Diagonal Up":
					spriteChoice = 8
					#print("Diagonal Down Diagonal Up")
				"Diagonal Down":
					spriteChoice = 2
					#print("Diagonal Down")
	pass


func grow_root():
	var newRootGrowth = rootSpriteGrowth.instantiate()
	add_child(newRootGrowth)
	print("Previous: " + previousRootSprite)
	previousRootSprite = newRootSprite
	pass
