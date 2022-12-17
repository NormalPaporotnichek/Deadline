extends Node2D

onready var infoLabel = $InfoLabel
var sceneNum: int = 0 
var is_unlocked

func _ready():
	infoLabel.text = "Choose label :/"
	pass 

func view_info():
	var level_data = SaveMaster.load_game_data()["scene"+str(sceneNum)]
	if level_data:
		if level_data["is_unlocked"]:
			if level_data["score"] != 0:
				infoLabel.text = "Level "+str(sceneNum)+"\nTime: "+format_seconds(float(level_data["time"]))+"\nScore: "+str(level_data["score"])
			else:
				infoLabel.text = "Level "+str(sceneNum)+"\nTime: ???\nScore: ???"
		else:
			infoLabel.text = "Level "+str(sceneNum)+" is locked!"
			sceneNum = -1
	else:
		sceneNum = -1
		infoLabel.text = "Save file is broken"

func format_seconds(time : float) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	var milliseconds := fmod(time, 1) * 100
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]

func _on_Button_mouse_entered():
	sceneNum = 1	
	view_info()
	pass 

func _on_Button2_mouse_entered():
	sceneNum = 2	
	view_info()
	pass 


func _on_Play_pressed():
	if sceneNum != -1:
		SceneTransition.change_scene("res://scenes/Scene"+str(sceneNum)+".tscn")
	


func _on_Back_pressed():
	SceneTransition.change_scene("res://scenes/Menu.tscn")
