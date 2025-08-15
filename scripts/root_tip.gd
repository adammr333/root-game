extends CharacterBody2D
class_name RootTip

@onready var game: Node = get_tree().get_root().get_node("Game")
@onready var rootSprite: Node = $RootSprite
@onready var growTimer: Node = $GrowTimer
@onready var tutorialLabel: Node = $TutorialText
@onready var animPlayer: Node = $AnimationPlayer

var direction: float
var speed: int = 100
var pointing: int = 0
var tutorial: bool
var tutorialCounter: int
var tutorialStep: int
var canInput: bool

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
	
	tutorial = true
	canInput = false
	tutorialStep = 0
	tutorialLabel.text = "The root will continuously grow forward."
	growTimer.start()
	pass


func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		if canInput && tutorialStep != 2 && tutorialStep != 3:
			pivotUp()
			if tutorial:
				if tutorialStep == 1:
					growTimer.start()
					canInput = false
				if tutorialStep == 4:
					growTimer.start()
					tutorialLabel.visible = false
					tutorialStep += 1
					tutorial = false
	if event.is_action_pressed("ui_down"):
		if canInput && tutorialStep != 1 && tutorialStep != 4:
			pivotDown()
			if tutorial:
				if tutorialStep == 2 || tutorialStep == 3:
					growTimer.start()
					canInput = false
	#if event.is_action_pressed("space"):
		#growTimer.start()
	pass


func pivotUp():
	match game.newRootSprite:
		"Straight":
			game.newRootSprite = "Diagonal Up"
		"Diagonal Up":
			game.newRootSprite = "Diagonal Up"
		"Diagonal Down":
			game.newRootSprite = "Straight"
	match game.previousRootSprite:
		"Straight":
			if pointing == 0:
				rootSprite.texture = load(rootTipSprite[3])
			if pointing == 1:
				rootSprite.texture = load(rootTipSprite[0])
		"Diagonal Up":
			if pointing == 0:
				rootSprite.texture = load(rootTipSprite[1])
			if pointing == 1:
				rootSprite.texture = load(rootTipSprite[5])
		"Diagonal Down":
			if pointing == 0:
				rootSprite.texture = load(rootTipSprite[8])
			if pointing == 1:
				rootSprite.texture = load(rootTipSprite[6])
	if pointing > -1:
		pointing -= 1
		direction -= speed
	pass


func pivotDown():
	match game.newRootSprite:
		"Straight":
			game.newRootSprite = "Diagonal Down"
		"Diagonal Up":
			game.newRootSprite = "Straight"
		"Diagonal Down":
			game.newRootSprite = "Diagonal Down"
	match game.previousRootSprite:
		"Straight":
			if pointing == 0:
				rootSprite.texture = load(rootTipSprite[4])
			if pointing == -1:
				rootSprite.texture = load(rootTipSprite[0])
		"Diagonal Up":
			if pointing == 0:
				rootSprite.texture = load(rootTipSprite[7])
			if pointing == -1:
				rootSprite.texture = load(rootTipSprite[5])
		"Diagonal Down":
			if pointing == 0:
				rootSprite.texture = load(rootTipSprite[2])
			if pointing == -1:
				rootSprite.texture = load(rootTipSprite[6])
	if pointing < 1:
		pointing += 1
		direction += speed
	pass


func _on_grow_timer_timeout() -> void:
	if tutorial:
		tutorialCounter += 1
		if tutorialCounter == 2:
			growTimer.stop()
			canInput = true
			tutorialStep += 1
			tutorialLabel.text += " Press UP to pivot the root up."
		if tutorialCounter == 4:
			growTimer.stop()
			canInput = true
			tutorialStep += 1
			tutorialLabel.text = "Press DOWN to pivot the root back straight."
		if tutorialCounter == 6:
			growTimer.stop()
			canInput = true
			tutorialStep += 1
			tutorialLabel.text = "Press DOWN again to pivot the root down."
		if tutorialCounter == 8:
			growTimer.stop()
			canInput = true
			tutorialStep += 1
			tutorialLabel.text = "Guide the root to the food. Press UP again to pivot the root back straight."
	game.grow_root()
	position += Vector2(speed, direction)
	match game.previousRootSprite:
		"Straight":
			rootSprite.texture = load(rootTipSprite[0])
		"Diagonal Up":
			rootSprite.texture = load(rootTipSprite[1])
		"Diagonal Down":
			rootSprite.texture = load(rootTipSprite[2])
	print(position)
	pass
