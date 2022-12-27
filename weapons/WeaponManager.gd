extends Node2D
signal weapon_changed(new_weapon)

onready var current_weapon
var weapons: Array = []

func _ready() -> void:
	weapons = get_children()
	for weapon in weapons:
		weapon.hide()
	current_weapon = weapons[0]
	current_weapon.show()

func add_ranged_weapon(weapon, Bullet, max_ammo, current_ammo, semi_auto) -> void:
	var new_weapon = weapon.instance()
	new_weapon.set("max_ammo",max_ammo)
	new_weapon.set("current_ammo",current_ammo)
	new_weapon.set("Bullet", Bullet.instance())
	new_weapon.set("semi_auto", semi_auto)
	new_weapon.set("weapon_sprite", load($Pistoletto.WeaponSprite))
	weapons.insert(0,new_weapon)
	
	print(weapons)

func _process(delta: float) -> void:
	if current_weapon is RangedWeapon:
		if not current_weapon.semi_auto and Input.is_action_pressed("leftClick"):
			current_weapon.shoot()
	if current_weapon is MeleeWeapon:
		if Input.is_action_pressed("leftClick"):
			current_weapon.attack()

func get_current_weapon():
	return current_weapon

func reload():
	current_weapon.start_reload()


func switch_weapon(weapon):
	if weapon == current_weapon:
		return
	current_weapon.hide()
	weapon.show()
	current_weapon = weapon
	emit_signal("weapon_changed", current_weapon)

func _unhandled_input(event: InputEvent) -> void:
	if current_weapon is RangedWeapon:
		if current_weapon.semi_auto and event.is_action_released("leftClick"):
			current_weapon.shoot()
		elif event.is_action_released("reload"):
			current_weapon.start_reload()
			current_weapon.end_reload()
	if event.is_action_released("weapon_1"):
		switch_weapon(weapons[0])
	if event.is_action_released("weapon_2"):
		switch_weapon(weapons[1])
	if event.is_action_released("weapon_3"):
		$Katana/AudioStreamPlayer2D.play()
		switch_weapon(weapons[2])
