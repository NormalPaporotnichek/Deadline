extends KinematicBody2D
class_name Player


#signal player_health_changed(new_health)
#signal died
const bullet_scene = preload("res://scenes/Bullet.tscn")


export (int) var speed = 150
export (int) var slowdownPoints = 2
export (float) var sprintSpeed = 1
export (bool) var defStand = false
export (bool) var running = false
export (bool) var rightMov = false
export (bool) var leftMov = false
export (bool) var upMov = false
export (bool) var downMov = false

signal player_fired_bullet(bullet, position, direction)

#export (PackedScene) var Bullet
onready var weapon: Weapon = $Weapon
onready var collision_shape = $CollisionShape2D
onready var anim_pl = $AnimationPlayer
#onready var team = $Team
#onready var weapon_manager = $WeaponManager
#onready var health_stat = $Health
#onready var camera_transform = $CameraTransform

func _ready() -> void:
	anim_pl.play("defStand")
#	weapon_manager.initialize(team.team)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("rightClick"):
		weapon.shoot()
	elif event.is_action_released("reload"):
		weapon.start_reload()
		weapon.end_reload()

func _physics_process(delta: float) -> void:
	#gun_direction.position = get_global_mouse_position()
	var player_pos = position
	var mouse_ditance = Vector2()
	var movement_direction := Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		movement_direction.y = -1
		defStand = true
		upMov = true
		
	if Input.is_action_pressed("down"):
		movement_direction.y = 1
		#anim_pl.play("walkDown")
		defStand = true
		downMov = true
		
	if Input.is_action_pressed("left"):
		movement_direction.x = -1
		defStand = true
		leftMov = true
		
	if Input.is_action_pressed("right"):
		movement_direction.x = 1
		defStand = true
		rightMov = true
		
	if defStand:
		anim_pl.play("defStand")
		
	if Input.is_action_pressed("sprint"):
		running = true
	else:
		running = false
		
	if running and sprintSpeed<2:
		sprintSpeed += 0.05
		
	if !running and sprintSpeed>1:
		sprintSpeed -= 0.05
		#if rightMov:
		#if leftMov:
		#if leftMov:
		#if leftMov:
	
	movement_direction = movement_direction.normalized() 
	move_and_slide(movement_direction * speed * sprintSpeed)
	defStand = false
	#end_of_gun.position.x=90*sin(200)
	#end_of_gun.position.y=90*cos(200)
	#gun_direction.look_at(get_global_mouse_position())
	#look_at(get_global_mouse_position())



#func set_camera_transform(camera_path: NodePath):
#	camera_transform.remote_path = camera_path


#func get_team() -> int:
#	return team.team


#func handle_hit():
#	health_stat.health -= 20
#	emit_signal("player_health_changed", health_stat.health)
#	if health_stat.health <= 0:
#		die()


#func die():
#	emit_signal("died")
#	queue_free()
