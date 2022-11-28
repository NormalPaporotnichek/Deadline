extends CanvasLayer
class_name Gui

onready var current_ammo = $CurrentAmmo
onready var max_ammo = $MaxAmmo
onready var timeText = $TimeText
onready var timer = $Timer
onready var current_weapon = $CurrentWeapon

var player: Player

func set_player(player: Player):
	self.player = player

	set_weapon(player.weapon_manager.get_current_weapon())
	player.weapon_manager.connect("weapon_changed", self, "set_weapon")


func set_weapon(weapon: Weapon):
	set_current_ammo(weapon.current_ammo)
	set_max_ammo(weapon.max_ammo)
	set_current_weapon_sprite(weapon.weapon_sprite)
	if not weapon.is_connected("weapon_ammo_changed", self, "set_current_ammo"):
		weapon.connect("weapon_ammo_changed", self, "set_current_ammo")
		

func set_current_ammo(new_ammo: int):
	current_ammo.text = str(new_ammo)

func set_current_weapon_sprite(weapon_sprite):
	#current_weapon.set_texture("res://assets/maga.jpg")
	current_weapon.texture = weapon_sprite
	#current_weapon.set_texture(weapon_sprite)

func set_max_ammo(new_max_ammo: int):
	max_ammo.text = str(new_max_ammo)
	
func _process(delta):
	timeText.text = format_seconds(timer.time_left)
	
func format_seconds(time : float) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	var milliseconds := fmod(time, 1) * 100
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	#player.die()
	player.die()
	pass
