extends Node2D
class_name MeleeWeapon

export (bool) var is_deletable: bool = true

onready var attack_cooldown = $AttackCooldown
onready var animation_player = $AnimationPlayer
onready var weapon_sprite = $Sprite
onready var audio = $AudioStreamPlayer

func _process(delta):
	look_at(get_global_mouse_position())
	
func attack():
	attack_cooldown.start()
	animation_player.play("attak")
	audio.play()
