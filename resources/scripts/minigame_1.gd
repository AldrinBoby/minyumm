extends Node2D
@onready var timer: Node2D = $Player/Timer
@onready var player: CharacterBody2D = $Player
@onready var checkpoint: Area2D = $checkpoint
@onready var checkpoint_2: Area2D = $checkpoint2

var time = 10
var respawn : Vector2


# Called when the node enters the scene tree for the first time
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player.respawn()
	print(timer.time)
func _on_checkpoint_body_entered(body: Node2D) -> void:
	if body == player:
		respawn = checkpoint.global_position
		$checkpoint/AnimatedSprite2D.play("active")
		timer.Timer(time)


func _on_checkpoint_2_body_entered(body: Node2D) -> void:
	if body == player:
		respawn = checkpoint_2.global_position
		$checkpoint2/AnimatedSprite2D.play("active")


func _on_ball_body_entered(body: Node2D) -> void:
	if body == player:
		player.damage(1)


func _on_boundary_body_entered(body: Node2D) -> void:
	if body == player:
		player.damage(3)
