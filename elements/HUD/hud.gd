extends CanvasLayer

@onready var label = $MarginContainer/VBoxContainer/HBoxContainer/Label

func _ready():
	Events.points_changed.connect(update_points)
	# Events.lives_changed.connect()

func update_points(points: int):
	label.text = str(points)
