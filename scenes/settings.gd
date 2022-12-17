extends Control

onready var master_slider = $Panel/VBoxContainer/HSlider
# Called when the node enters the scene tree for the first time.
func _ready():
	master_slider.value = Save.game_data.master_vol
	
func _on_CheckButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	
func _on_HSlider_value_changed(value):
	GlobalSettings.update_master_vol(value)
