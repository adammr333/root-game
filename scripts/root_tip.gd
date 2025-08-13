extends CharacterBody2D

@onready var game: Node = get_tree().get_root().get_node("Game")
@onready var rootSprite: Node = $RootSprite
@onready var growTimer: Node = $GrowTimer

var direction: float
var speed: int = 100
var pointing: String = "Straight"

var rootTipSprite: Array = [
	"res://assets/root_sprites/root-tip-straight.png", #0
	"res://assets/root_sprites/root-tip-diagonal-up.png", #1
	"res://assets/root_sprites/root-tip-diagonal-down.png", #2
	"res://assets/root_sprites/root-tip-straight-diagonal-up.png", #3
	"res://assets/root_sprites/root-tip-straight-diagonal-down.png", #4
	"res://assets/root_sprites/root-tip-diagonal-up-straight.png", #5
	"res://assets/root_sprites/root-tip-diagonal-down-straight.png", #6
	"res://assets/root_sprites/root-tip-diagonal-up-diagonal-down.png", #7
	"res://assets/root_sprites/root-tip-diagonal-down-diagonal-up.png" #8
]

func _ready() -> void:
	growTimer.start()
	pass


func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		match game.newRootSprite:
			"Straight":
				game.newRootSprite = "Diagonal Up"
			"Diagonal Up":
				game.newRootSprite = "Diagonal Up"
			"Diagonal Down":
				game.newRootSprite = "Straight"
		print(game.newRootSprite)
		if rotation_degrees != -45:
			#rotation_degrees -= 45
			direction += -speed
	if event.is_action_pressed("ui_down"):
		match game.newRootSprite:
			"Straight":
				game.newRootSprite = "Diagonal Down"
			"Diagonal Up":
				game.newRootSprite = "Straight"
			"Diagonal Down":
				game.newRootSprite = "Diagonal Down"
		print(game.newRootSprite)
		if rotation_degrees != 45:
			#rotation_degrees += 45
			direction += speed
	#if event.is_action_pressed("space"):
		#growTimer.start()
	pass


func _on_grow_timer_timeout() -> void:
	game.grow_root()
	position += Vector2(speed, direction)
	match game.previousRootSprite:
		"Straight":
			rootSprite.texture = load(rootTipSprite[0])
		"Diagonal Up":
			rootSprite.texture = load(rootTipSprite[1])
		"Diagonal Down":
			rootSprite.texture = load(rootTipSprite[2])
	pass
