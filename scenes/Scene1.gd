extends Node

onready var bullet_manager: BulletManager = $BulletManager
onready var player: Player = $Player
onready var gui = $GUI

func _ready() -> void:
	SaveMaster.create_game_data()
	GlobalSignals.connect("bullet_fired", bullet_manager, "handle_bullet_spawned")
	GlobalSignals.connect("ammo_view", gui, "ammo_view")
	gui.set_player(player)
