extends Node

onready var bullet_manager: BulletManager = $BulletManager
onready var player: Player = $Player
onready var gui = $GUI

func _ready() -> void:
	SaveMaster.update_scene_data(2, true, 0, 0)
	var level_data=SaveMaster.load_game_data()
	gui.set_time(level_data["scene1"]["time"])
	GlobalSignals.connect("bullet_fired", bullet_manager, "handle_bullet_spawned")
	GlobalSignals.connect("ammo_view", gui, "ammo_view")
	gui.set_player(player)
