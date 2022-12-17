extends CanvasLayer
class_name Gui

onready var current_ammo = $CurrentAmmo
onready var max_ammo = $MaxAmmo
onready var timeText = $TimeText
onready var timer = $Timer

var player: Player

func set_time(time: float):
	timer.start(time)

func set_player(player: Player):
	self.player = player
	set_weapon(player.weapon_manager.get_current_weapon())
	player.weapon_manager.connect("weapon_changed", self, "set_weapon")

func set_weapon(weapon):
	if weapon is RangedWeapon:
		current_ammo.visible = true
		max_ammo.visible = true
		set_current_ammo(weapon.current_ammo)
		set_max_ammo(weapon.max_ammo)
		if not weapon.is_connected("weapon_ammo_changed", self, "set_current_ammo"):
			weapon.connect("weapon_ammo_changed", self, "set_current_ammo")
	elif weapon is MeleeWeapon:
		current_ammo.visible = false
		max_ammo.visible = false
		

func set_current_ammo(new_ammo: int):
	current_ammo.text = str(new_ammo)

func set_max_ammo(new_max_ammo: int):
	max_ammo.text = str(new_max_ammo)
	
func _process(delta):
	timeText.text = format_seconds(timer.time_left)
	
func format_seconds(time : float) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	var milliseconds := fmod(time, 1) * 100
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]


func _on_Timer_timeout():
	player.die()
	pass
