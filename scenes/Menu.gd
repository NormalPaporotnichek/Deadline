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
	SceneTransition.change_scene("res://Main.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Authors_pressed():
	get_tree().change_scene("res://scenes/Item.tscn")
