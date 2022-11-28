extends Node2D
class_name Weapon


signal weapon_ammo_changed(new_ammo_count)
signal weapon_out_of_ammo


export (PackedScene) var Bullet
#export (String) var weapon_type
export (int) var max_ammo
export (bool) var semi_auto: bool = true

var current_ammo: int = max_ammo setget add_current_ammo

#onready var gui: Gui = $GUI
onready var shoot_audio = $ShootAudio
onready var end_of_gun = $EndOfGun
onready var attack_cooldown = $AttackCooldown
onready var animation_player = $AnimationPlayer
onready var muzzle_flash = $MuzzleFlash
onready var weapon_sprite = $WeaponSprite

func _ready() -> void:
	muzzle_flash.hide()
	current_ammo = max_ammo

func _process(delta):
	look_at(get_global_mouse_position())

func start_reload():
	animation_player.play("reload")
	
func end_reload():
	current_ammo = max_ammo
	emit_signal("weapon_ammo_changed", current_ammo)
	
func respawn():
	current_ammo = max_ammo
	emit_signal("weapon_ammo_changed", current_ammo)
	
func add_current_ammo(new_ammo: int):
	var actual_ammo = clamp(new_ammo+current_ammo, 0, max_ammo)
	if actual_ammo != current_ammo:
		current_ammo = actual_ammo
		if current_ammo == 0:
			emit_signal("weapon_out_of_ammo")
		emit_signal("weapon_ammo_changed", current_ammo)
	
func shoot():
	#gui.set_current_weapon_sprite(weapon_sprite)
	if current_ammo != 0 and attack_cooldown.is_stopped() and Bullet != null:
		var bullet_instance = Bullet.instance()
		var direction = (end_of_gun.global_position - global_position).normalized()
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, end_of_gun.global_position, direction)
		attack_cooldown.start()
		animation_player.play("muzzle_flash")
		shoot_audio.play()
		add_current_ammo(-1)
		
