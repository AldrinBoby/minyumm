extends Node2D
@onready var garlic_container: HBoxContainer = $GarlicContainer

@onready var garlic: TextureRect = $GarlicContainer/Garlic1
@onready var garlic_2: TextureRect = $GarlicContainer/Garlic2
@onready var garlic_3: TextureRect = $GarlicContainer/Garlic3
@onready var garlic_4: TextureRect = $GarlicContainer/Garlic4
@onready var garlic_5: TextureRect = $GarlicContainer/Garlic5

@onready var level:RichTextLabel=$level
@onready var timer:RichTextLabel=$timer

var time 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(5)
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://resources/scenes/title_screen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:
		4:
			garlic.hide()
		3:
			garlic.hide()
			garlic_2.hide()
		2:
			garlic.hide()
			garlic_2.hide()
			garlic_3.hide()
		1:
			garlic.hide()
			garlic_2.hide()
			garlic_3.hide()
			garlic_4.hide()
		0:
			garlic_container.hide()
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done) 
	

func Timer(start_time:float) -> void:
	time=start_time
	while time>0.0:
		await wait(0.1)
		time-=0.1
		
	return 
	
func wait(seconds:float) -> void:
	await get_tree().create_timer(seconds)
