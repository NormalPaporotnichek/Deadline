extends Control

onready var camera = get_node("/root/Node/Camera2D")

var is_paused = false setget set_is_dead
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func set_is_dead(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
#func _process(delta):
	#self.possition = camera.possition

func _on_Button_pressed():
	get_tree().quit()


func _on_Button2_pressed():
	SceneTransition.change_scene("res://Main.tscn")
