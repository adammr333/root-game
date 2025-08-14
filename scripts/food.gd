extends Area2D

@onready var animPlayer: Node = $AnimationPlayer
@onready var game: Node = get_tree().get_root().get_node("Game")

var spawnPosition: int

var spawnPositionArray: Array = [-200, -100, 0, 100, 200]

signal collect


func _ready() -> void:
	spawnPosition = randi_range(0, 4)
	position = get_node("/root/Game/RootTip").global_position + Vector2(600.0, spawnPositionArray[spawnPosition])


func _on_body_entered(body: Node2D) -> void:
	if body is RootTip:
		animPlayer.play("shrink")
		game.foodCount += 1
		game.witherCounter -= 5
		print("Food: " + str(game.foodCount))


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
