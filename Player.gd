extends Area2D


var screen_size # Size of the game window.
const max_speed = 200
const min_speed = 60
export var speed = 80 # How fast the player will move (pixels/sec).
export var acceleration = 10
export var turn_speed = 0.05


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_direction = Vector2(0, -1)
	if Input.is_action_pressed("move_right"):
		rotation -= turn_speed
		# TODO: play turn_left sprite
	if Input.is_action_pressed("move_left"):
		rotation += turn_speed
		# TODO: play turn_right sprite
	if Input.is_action_pressed("break"):
		speed = max(min_speed, speed - acceleration)
		# TODO: play accelerate sprite
	if Input.is_action_pressed("thrust"):
		speed = min(max_speed, speed + acceleration)
		# TODO: play break sprite
		# $ThrustAnimatedSprite.play()
	movement_direction = movement_direction.rotated(rotation)
	position.x += movement_direction.x * speed * delta
	position.y += movement_direction.y * speed * delta
	# We can also use clamp() to prevent it from leaving the screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	#if velocity.length() > 0:
	#	velocity = velocity.normalized() * speed
	#	$AnimatedSprite.play()
	#else:
	#	$AnimatedSprite.stop()
