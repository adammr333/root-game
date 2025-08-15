extends Node2D

@onready var animPlayer: Node = $AnimationPlayer


func _ready() -> void:
	animPlayer.play("opening")
