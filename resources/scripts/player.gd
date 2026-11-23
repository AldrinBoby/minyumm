extends CharacterBody2D

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
#setting the animations
	if velocity.y < 0:
		animated.play("jump")
		if direction > 0:
			animated.flip_h=0
		if direction < 0:
			animated.flip_h=1
	elif velocity.y > 0:
		animated.play("fall")

	elif direction >= 1:
		animated.play("run")
		animated.flip_h = 0
	elif direction <= -1:
		animated.play("run")
		animated.flip_h = 1
		
	elif direction == 0:
		animated.play("idle")


		

	move_and_slide()
