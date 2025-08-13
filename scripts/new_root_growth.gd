extends Node2D

@onready var rootTip = get_node("/root/Game/RootTip")
@onready var game = get_node("/root/Game")
@onready var rootSprite: Node = $RootSprite

var spriteChoice

var rootGrowthSprite: Array = [
	"res://assets/root_sprites/root-outlines-straight.png", #0
	"res://assets/root_sprites/root-outlines-diagonal-up.png", #1
	"res://assets/root_sprites/root-outlines-diagonal-down.png", #2
	"res://assets/root_sprites/root-outlines-straight-diagonal-up.png", #3
	"res://assets/root_sprites/root-outlines-straight-diagonal-down.png", #4
	"res://assets/root_sprites/root-outlines-diagonal-up-straight.png", #5
	"res://assets/root_sprites/root-outlines-diagonal-down-straight.png", #6
	"res://assets/root_sprites/root-outlines-diagonal-up-diagonal-down.png", #7
	"res://assets/root_sprites/root-outlines-diagonal-down-diagonal-up.png" #8
]


func _ready() -> void:
	global_position = rootTip.global_position
	rootSprite.texture = load(rootGrowthSprite[game.spriteChoice])
