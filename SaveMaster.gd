extends Node

const SAVE_DIR = "user://saves/"

func save_level_data(sceneNum: int, is_unlocked: bool, time: String, score: int):
	var save_path = SAVE_DIR + "scene"+String(sceneNum)+"_save.dat"
	var data = {
		["scene1"]:{
		"score": 0,
		"time": 0,
		"is_unlocked": false
		},
		["scene2"]:{
		"score": 0,
		"time": 0,
		"is_unlocked": false
		}
	}
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, "MyPassword123")
	if error == OK:
		file.store_var(data)
		file.close()
	print("data saved")
	

func update_level_data(sceneNum: int, is_unlocked: bool, time: String, score: int):
	var save_path = SAVE_DIR + "scene"+String(sceneNum)+"_save.dat"
	var data = {
		["scene1"]:{
		"score": 0,
		"time": 0,
		"is_unlocked": false
		},
		["scene2"]:{
		"score": 0,
		"time": 0,
		"is_unlocked": false
		}
	}
	
	var dir = Directory.new()
	if !dir.dir_exists(SAVE_DIR):
		dir.make_dir_recursive(SAVE_DIR)
	
	var file = File.new()
	var error = file.open_encrypted_with_pass(save_path, File.WRITE, "MyPassword123")
	if error == OK:
		file.store_var(data)
		file.close()
	print("data saved")

func load_level_data(sceneNum: int):
	var save_path = SAVE_DIR + "scene"+String(sceneNum)+"_save.dat"
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, "MyPassword123")
		print("Error status: "+str(error))
		if error == OK:
			var player_data = file.get_var()
			file.close()
			print("data loaded")
			print(player_data)
			return player_data
		else:
			return null
	else:
		return null

