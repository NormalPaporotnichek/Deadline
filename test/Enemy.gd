extends KinematicBody2D

var speed = 100
var player = null
var motion = Vector2.ZERO
var bullet = preload("res://weapons/Bullet.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player")
	
func _physics_process(delta):
	motion = Vector2.ZERO
	if player:
		motion = position.direction_to(player.position) * speed
		#look_at(player.global_position)
	motion = move_and_slide(motion)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("Entered")
		player = body

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		print("Exited")
		player = null

func _on_Area2D2_body_entered(body):
	if body.name == "Bullet":
		
		$AnimatedSprite.hide()
		#$CollisionShape2D.set_collision_mask_bit(0, false)
		$Area2D.set_collision_mask_bit(0, false)
		$Area2D2.set_collision_mask_bit(0, false)
		$AnimatedSprite2.show()
		$AnimatedSprite2.play("default")
		#$AnimationPlayer.play()
		speed = 0
		
	
		$Area2D2.set_collision_mask_bit(0, false)
		
		print("COCK!")
		$Timer.start()
	#if body.name == "Player":
	#	get_tree().change_scene("res://test/death.tscn")


func _on_Timer_timeout():
	queue_free()
