extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var collisionshape: CollisionShape2D = $CollisionShape2D
@onready var boom: AnimatedSprite2D = $AnimatedSprite2D

@export var fall_speed := 500.0


var exploding:bool = false
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if exploding:
		return
	var velocity = Vector2(0,fall_speed)
	var collision = move_and_collide(velocity * delta)
	if collision:
		explode()
func explode() -> void:
		velocity = Vector2.ZERO
		exploding = true
		sprite.hide()
		collisionshape.set_deferred("disabled",true)
		boom.play("boom")
		await boom.animation_finished
		queue_free()
		
		
