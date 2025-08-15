extends Node2D

@onready var title: Node = $Title
@onready var labelAnimPlayer: Node = $Title/Label/AnimationPlayer
@onready var animPlayer: Node = $AnimationPlayer

var canInput: bool = true
var canDrop: bool = false


func _ready() -> void:
	labelAnimPlayer.play("label")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") && canInput:
		title.visible = false
		animPlayer.play("opening")
		animPlayer.seek(1.0, true)
		animPlayer.pause()
		canDrop = true
	if event.is_action_pressed("ui_down") && canDrop && canInput:
		animPlayer.play("opening")
		animPlayer.seek(2.0, true)
		canInput = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
