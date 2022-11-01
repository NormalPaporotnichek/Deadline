extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


onready var bullet_manager = $BulletManager
onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass