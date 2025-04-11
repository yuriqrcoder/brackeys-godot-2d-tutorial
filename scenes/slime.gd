extends Node2D

const SPEED: int = 60
func _process(delta: float) -> void:
	position.x += SPEED * delta
