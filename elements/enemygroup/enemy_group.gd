extends Node2D

var direction := Vector2.RIGHT
var speed := 20.0

const row_speed = 10.0
const speed_boost = 0.7

@onready var blocker := $Blocker
@onready var shooter := $Shooter

func _process(delta: float):
	global_position += direction * speed * delta

func change_direction():
	if blocker.time_left > 0:
		return
	direction = Vector2.LEFT if direction == Vector2.RIGHT else Vector2.RIGHT
	global_position.y += row_speed
	speed += speed_boost
	blocker.start()

func _on_shot_timer_timeout():
	pass

func _on_shooter_timeout():
	var enemies = get_tree().get_nodes_in_group('enemy')
	if enemies.size() > 0:
		enemies.pick_random().shot()
