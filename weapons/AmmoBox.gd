extends Area2D

export var ammo: int = 1
var is_pickable_me: bool = false
export var playerName: String = "Player"

func body_entered(body):
	print("sdad")
	if body.name == playerName:
		print("sdad")
		is_pickable_me = true
		
func body_exited(body):
	if body.name == playerName:
		is_pickable_me = false
	
func _input(event):
	var current_weapon = get_parent().get_parent().get_node(playerName).weapon_manager.get_current_weapon()
	if event.is_action_pressed("use") and is_pickable_me and (current_weapon is RangedWeapon):
		current_weapon.add_current_ammo(ammo)
		get_parent().remove_child(self)
