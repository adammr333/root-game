extends Node2D

#colors:
#green: 34a342
#brown: 663831

@onready var ground: Node = $Ground
@onready var rootTip: Node = $RootTip
@onready var camera: Node = $RootTip/RootCamera
@onready var foodContainer: Node = $FoodContainer
@onready var animPlayer: Node = $AnimationPlayer
@onready var blackScreen: Node = $BlackScreen

var windowWidth: float = DisplayServer.window_get_size().x
var windowHeight: float = DisplayServer.window_get_size().y
var rootSpriteGrowth: Resource = load("res://scenes/new_root_growth.tscn")
var newFoodLoad: Resource = load("res://scenes/food.tscn")
var newRootGrowthIndex: int = get_child_count() - 1
var previousRootSprite: String = "Straight"
var newRootSprite: String = "Straight"
var spriteChoice: int
var foodSpawnCounter: int = 0
var foodCount: int = 0
var witherCounter: int = -5


func _ready() -> void:
	#get_window().size = Vector2(640, 360)
	#ground.size = Vector2(windowWidth, windowHeight)
	#print(ground.size)
	#rootTip.global_position = Vector2(windowWidth / 2, windowHeight / 2)
	#camera.limit_left = windowWidth - windowWidth
	#camera.limit_right = windowWidth
	#camera.limit_top = windowHeight - windowHeight
	#camera.limit_bottom = windowHeight
	$Seed.get_child(0).frame = 1
	pass


func _process(delta: float) -> void:
	if foodCount == 10:
		foodCount = 0
		rootTip.growTimer.stop()
		animPlayer.play("game_win")
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
	previousRootSprite = newRootSprite
	foodSpawnCounter += 1
	if foodSpawnCounter == 5:
		spawn_food()
	witherCounter += 1
	print("Wither: " + str(witherCounter))
	if witherCounter == 10:
		print("The Flower Has Withered")
		foodCount = 0
		rootTip.growTimer.stop()
		blackScreen.global_position = rootTip.global_position
		blackScreen.visible = true
	ground.scale += Vector2(1.0, 1.0)
	pass


func spawn_food():
	var newFood = newFoodLoad.instantiate()
	get_node("FoodContainer").add_child(newFood)
	foodSpawnCounter = 0


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "game_win":
		foodCount = 0
