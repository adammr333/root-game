extends CharacterBody2D

@onready var game: Node = get_tree().get_root().get_node("Game")
@onready var growTimer: Node = $GrowTimer

var direction: float
var speed: int = 25


func _ready() -> void:
	growTimer.start()
	pass


func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") && rotation_degrees != -45:
		rotation_degrees -= 45
		direction += -speed
	if event.is_action_pressed("ui_down") && rotation_degrees != 45:
		rotation_degrees += 45
		direction += speed


func _on_grow_timer_timeout() -> void:
	game.grow_root()
	position += Vector2(speed, direction)
	pass
