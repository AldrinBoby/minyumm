extends Node2D
@onready var timer: Node2D = $Player/Timer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.Timer(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
