extends Area2D

var group_type: String
var current_ammo: int
var item_type: String
var is_pickable_me: bool = false

var player: Player
onready var sprite = $Sprite
onready var collision_shape = $CollisionShape2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func create(group_type: String, item_type: String, current_ammo: int, item_position: Vector2, player: Player):
	#sprite.texture = load("res://assets/items/"+group_type+"_"+item_type+".png")
	#sprite.texture = load("res://assets/weapon/aim.png")
	self.current_ammo = current_ammo
	self.item_type = item_type
	self.group_type = group_type
	self.player = player
	self.position = item_position
	return self
	
func _ready():
	connect("body_entered", self, "_on_Item_body_entered")
	connect("body_exited", self, "_on_Item_body_exited")

func _on_Item_body_entered(body):
	if body.name == 'Player':
		is_pickable_me = true
		
func _on_Item_body_exited(body):
	if body.name == 'Player':
		is_pickable_me = false
		

#func set_weapon(weapon: Weapon):
#	if not weapon.is_connected("weapon_ammo_changed", self, "add_current_ammo"):
#		weapon.connect("weapon_ammo_changed", self, "add_current_ammo")

func _input(event):
	if event.is_action_pressed("E") and is_pickable_me:
		#set_weapon(player.weapon_manager.get_current_weapon())
		#player.weapon_manager.connect("weapon_changed", self, "set_weapon")
		var current_weapon = player.weapon_manager.get_current_weapon()
		if current_weapon.name == group_type:
			current_weapon.add_current_ammo(current_ammo)
			get_parent().remove_child(self)
		#weapon.add_current_ammo(current_ammo)
		#player.pick() 
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
