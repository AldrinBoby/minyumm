extends GPUParticles2D
var seconds = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position.x = move_toward(position.x,-1000,1)
	await wait (0.1)
	
	position.x = move_toward(position.x,1000,1)
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
 
