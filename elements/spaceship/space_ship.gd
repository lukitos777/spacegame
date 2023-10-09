extends CharacterBody2D

const players_bullet = preload('res://elements/bullet/players_bullet.tscn')
var speed = 100  

func _physics_process(delta):
	if Input.is_action_just_pressed('ui_accept'):
		shot()
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	global_position.x += direction * speed * delta
	velocity.x = direction * speed
	
	move_and_slide()

func shot():
	var bullet = players_bullet.instantiate()
	bullet.global_position = global_position + Vector2(0, -30)
	add_child(bullet)
	
func take_daamage():
	Globals.change_lives(-1)
