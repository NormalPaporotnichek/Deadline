extends Control


onready var GUI = get_node("/root/Node/GUI")

var is_paused = false setget set_is_paused

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	if GUI:
		GUI.hide()
		
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

func _on_resume_pressed():
	self.is_paused = false



func _on_quit_pressed():
	get_tree().quit()


func _on_back_to_menu_pressed():
	get_tree().change_scene("res://Menu.tscn")
