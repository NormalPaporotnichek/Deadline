extends Control

onready var camera = get_parent().get_node("Player/Camera2D")

var is_paused = false setget set_is_paused

	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused
		$CenterContainer/VBoxContainer2.hide()
		$CenterContainer/VBoxContainer.show()
		

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var master_slider = $Panel/VBoxContainer/HSlider
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.

#func _process(delta):
	#self.possition = camera.possition

func _on_resume_pressed():
	self.is_paused = false



func _on_quit_pressed():
	get_tree().quit()


func _on_back_to_menu_pressed():
	get_tree().change_scene("res://Menu.tscn")





func _on_Button_pressed():

	$CenterContainer/VBoxContainer.hide()
	$CenterContainer/VBoxContainer2.show()


func _on_CheckButton_pressed():
	#CenterContainer/VBoxContainer.get_viewport_rect().size/2
	OS.window_fullscreen = !OS.window_fullscreen
	
	


func _on_Button3_pressed():
	
	$CenterContainer/VBoxContainer2.hide()
	$CenterContainer/VBoxContainer.show()
	
func _on_HSlider_value_changed(value):
	GlobalSignals.update_master_vol(value) 	
