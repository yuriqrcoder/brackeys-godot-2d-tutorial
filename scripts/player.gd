extends CharacterBody2D

#Variables
const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Node declarations
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Runs every frame evenly, it process the game physics
func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction: - 1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flips the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor(): # Plays when the character is on the ground
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Func that makes player move
	move_and_slide()
