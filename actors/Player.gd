extends KinematicBody2D
class_name Player
const MAX_SPEED = 200
const FRICTION = 500
const ACCELERATION = 650

onready var weapon_manager = $WeaponManager
signal player_fired_bullet(bullet, position, direction)
signal died

var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector* MAX_SPEED, ACCELERATION *delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	if Input.is_action_pressed("sprint"):
		move_and_collide(1.4*velocity * delta)
	else:
		move_and_collide(velocity * delta)

func die():
	SceneTransition.change_scene("res://scenes/Menu.tscn")
