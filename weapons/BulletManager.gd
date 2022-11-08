extends Node2D
class_name BulletManager

func handle_bullet_spawned(bullet: Bullet, position: Vector2, direction: Vector2):
	print("player hit! ", "d")
	add_child(bullet)
	bullet.global_position = position
	bullet.set_direction(direction)
	print("player hit! ", "sfdfsfd")