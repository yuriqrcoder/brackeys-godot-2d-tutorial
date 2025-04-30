extends Area2D

# Node declarations
@onready var timer: Timer = $Timer

# Signal activated when player dies
func _on_body_entered(body: Node2D) -> void:
	# Slows game in half for a effect
	Engine.time_scale = 0.5
	# Removes the player collision
	body.get_node("CollisionShape2D").queue_free()
	# Starts a timer to reset the game
	timer.start()

# Timer signal
func _on_timer_timeout() -> void:
	# Reverts the game time to normal 1
	Engine.time_scale = 1
	# Restarts the scene
	get_tree().reload_current_scene()
