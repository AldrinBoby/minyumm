extends Node2D
@onready var timer: Node2D = $Player/Timer
@onready var player: CharacterBody2D = $Player
@onready var checkpoint: Area2D = $checkpoint
@onready var checkpoint_2: Area2D = $checkpoint2


var time = 50
var respawn : Vector2


# Called when the node enters the scene tree for the first time
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player.respawn()

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
		
		
		
# code for the platforms{

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		$falling/falling_pf2/AnimationPlayer.play("fall")
		await  get_tree().create_timer(0.3).timeout
		$falling/falling_pf2/falling_platform/CollisionShape2D.set_deferred("disabled",true)
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	await  get_tree().create_timer(3).timeout
	$falling/falling_pf2.position = Vector2(-1926.0,524.0)
	$falling/falling_pf2/falling_platform/CollisionShape2D.set_deferred("disabled",false)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body == player:
		$falling/falling_pf4/AnimationPlayer.play("fall4")
		await  get_tree().create_timer(0.3).timeout
		$falling/falling_pf4/falling_platform/CollisionShape2D.set_deferred("disabled",true)
		
func _on_area_2d_2_body_exited(body: Node2D) -> void:
	await  get_tree().create_timer(3).timeout
	$falling/falling_pf4.position = Vector2(-530.0,8.0)
	$falling/falling_pf4/falling_platform/CollisionShape2D.set_deferred("disabled",false)


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body == player:
		$falling/falling_pf3/AnimationPlayer.play("fall3")
		await  get_tree().create_timer(0.3).timeout
		$falling/falling_pf3/falling_platform/CollisionShape2D.set_deferred("disabled",true)

func _on_area_2d_3_body_exited(body: Node2D) -> void:
	await  get_tree().create_timer(3).timeout
	$falling/falling_pf3.position = Vector2(-252.0,353.0)
	$falling/falling_pf3/falling_platform/CollisionShape2D.set_deferred("disabled",false)
# }
