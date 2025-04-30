extends Node2D

# Const slime speed
const SPEED: int = 60

# Node declarations
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Variables
var direction = 1

# Runs every frame
func _process(delta: float) -> void:
	# Activates when the slime hits a wall and it triggers the
	# direction's ray cast
	
	# Right
	if ray_cast_right.is_colliding():
		direction = -1 # Changes direction
		animated_sprite.flip_h = true # Flips the sprite
	# Left
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	# Constantly changes the slime position, making it move
	position.x += direction * SPEED * delta
