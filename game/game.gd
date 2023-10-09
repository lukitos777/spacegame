extends Node2D

@onready var game_over = preload("res://elements/gameover/gameover.tscn")

func _ready():
	Events.lives_changed.connect(func(lives): checker)
	Events.enemy_checker.connect(checker)
	
func checker(lives: int):
	var enemies = get_tree().get_nodes_in_group("enemy")
	if Globals.lives < 0 or enemies.size() <= 1:
		add_child(game_over.instantiate())
