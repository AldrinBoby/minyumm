extends CharacterBody2D
@onready var hurt: AudioStreamPlayer2D = $sounds/hurt
@onready var jump: AudioStreamPlayer2D = $sounds/jump
@onready var footstep: AudioStreamPlayer2D = $sounds/footstep

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D
@export var health = 4
const SPEED = 500.0
const JUMP_VELOCITY = -500.0


func _ready() -> void:
	$"..".respawn = global_position

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("l"):
		damage(1)
		print(health)

		
# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.playing = 1

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
		footstep.playing = 1
	elif direction <= -1:
		animated.play("run")
		animated.flip_h = 1
		
	elif direction == 0:
		animated.play("idle")

	move_and_slide()
	
func damage(amount:int):
	health -= amount
	health = max(health,0)
	if health <= 3:
		hurt.playing = 1
	

		
func respawn():
		#Adds the respawn
	if health == 0:
		global_position = $"..".respawn
		health = 3
