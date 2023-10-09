extends HBoxContainer

@onready var Live_El = preload("res://elements/livesbar/heart.tscn")

func _ready():
	Events.lives_changed.connect(update_lives)
	update_lives(Globals.lives)

func update_lives(lives: int):
	if lives < 0:
		return 
	var diff = lives - get_child_count()
	for i in range(abs(diff)):
		add_live() if diff > 0 else remove_live()

func add_live():
	add_child(Live_El.instantiate())
	
func remove_live():
	get_child(0).queue_free()
