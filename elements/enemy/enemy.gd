extends CharacterBody2D

@onready var ray_left := $RayCast2Dleft
@onready var ray_right := $RayCast2Dright

const bullet_scene = preload("res://elements/enemy_bullet/enemy_bullet.tscn")

func _physics_process(delta):
	if ray_left.is_colliding() or ray_right.is_colliding():
		get_tree().call_group('enemy_group', 'change_direction')

func destroy():
	Globals.change_points(1)
	Events.enemy_checker.emit()
	queue_free()

func shot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position += global_position + Vector2(0, 30)
	add_child(bullet)
