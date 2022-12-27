extends Control

#onready var animationPlayer = $AnimationPlayer
export var animation = "Slide"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Start_pressed():
	$AudioStreamPlayer2.play()
	SceneTransition.change_scene("res://scenes/Scene1.tscn")


func _on_Quit_pressed():
	$AudioStreamPlayer2.play()
	get_tree().quit()


func _on_Authors_pressed():
	$AudioStreamPlayer2.play()
	get_tree().change_scene("res://scenes/Authors.tscn")


func _on_Levels_pressed():
	$AudioStreamPlayer2.play()
	SceneTransition.change_scene("res://scenes/LevelMenu.tscn")


func _on_Start_mouse_exited():

	pass # Replace with function body.


func _on_Option_mouse_exited():
	
	pass # Replace with function body.


func _on_Authors_mouse_exited():

	pass # Replace with function body.


func _on_Quit_mouse_exited():

	pass # Replace with function body.


func _on_Start_focus_entered():
	pass # Replace with function body.


func _on_Start_mouse_entered():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_Option_mouse_entered():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_Levels_mouse_entered():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_Authors_mouse_entered():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_Quit_mouse_entered():
	$AudioStreamPlayer.play()
	pass # Replace with function body.
