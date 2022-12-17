extends Node

const SAVE_DIR = "user://saves/"

func create_game_data():
	var save_path = SAVE_DIR + "deadline_save.dat"
	var data = {
		"scene1":{
		"score": 0,
		"time": 0,
		"is_unlocked": true
		},
		"scene2":{
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
	

func update_scene_data(sceneNum: int, is_unlocked: bool, time: float, score: int):
	var save_path = SAVE_DIR + "deadline_save.dat"
	var file = File.new()
	if file.file_exists(save_path):
		var error = file.open_encrypted_with_pass(save_path, File.READ, "MyPassword123")
		print("Error status: "+str(error))
		if error == OK:
			var player_data = file.get_var()
			player_data["scene"+str(sceneNum)] = {
			"score": score,
			"time": time,
			"is_unlocked": is_unlocked
			}
			error = file.open_encrypted_with_pass(save_path, File.WRITE, "MyPassword123")
			if error == OK:
				file.store_var(player_data)
				file.close()
				print("data updated")
				print(player_data)
				return true
			else: 
				return false
		else:
			return false
	else:
		return false

func load_game_data():
	var save_path = SAVE_DIR + "deadline_save.dat"
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

