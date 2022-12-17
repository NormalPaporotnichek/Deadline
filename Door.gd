extends Area2D
export var sceneName: String
var is_pickable_me: bool = false

onready var sprite = $Sprite
onready var collision_shape = $CollisionShape2D
	
func _ready():
	connect("body_entered", self, "_on_Door_body_entered")
	connect("body_exited", self, "_on_Door_body_exited")

func _on_Door_body_entered(body):
	if body.name == 'Player':
		is_pickable_me = true
		
func _on_Door_body_exited(body):
	if body.name == 'Player':
		is_pickable_me = false
		
	
func _input(event):
	if event.is_action_pressed("use") and is_pickable_me:
		var time = get_parent().get_node("GUI/Timer").time_left
		SaveMaster.update_scene_data(1, true, time,120)
		SceneTransition.change_scene("res://scenes/"+sceneName+".tscn")
