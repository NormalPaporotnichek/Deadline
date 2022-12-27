extends KinematicBody2D
class_name Player
export (int) var MAX_SPEED = 200
const FRICTION = 500
const ACCELERATION = 650

onready var weapon_manager = $WeaponManager
signal player_fired_bullet(bullet, position, direction)
signal died

var is_paused = false
var enemy = null
var velocity = Vector2.ZERO

func _ready() -> void:
	enemy = get_tree().get_nodes_in_group("Enemy")
	
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

#func die():
	#SceneTransition.change_scene("res://scenes/Menu.tscn")


func set_is_paused(value):

		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused

#
func _on_Area2D_body_entered(body):
	
	if body.name == "Enemy":
		print("EnteredE")
		$WeaponManager.queue_free()
		$AudioStreamPlayer2D.play()
		#Music.pa()
		$WeaponManager.queue_free()
		MAX_SPEED = 0
		$PlayerSprite.hide()
		$Sprite.show()
		$Timer.start()
		
		
		

	
func _on_Area2D_body_exited(body):
	print("ExitedE")
	enemy = null
func _on_Timer_timeout():
	get_tree().change_scene("res://test/death.tscn")
