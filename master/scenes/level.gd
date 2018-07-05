extends Node

var curser = load("res://art/spr_MouseCursor_0.png")

func _ready():
	Input.set_custom_mouse_cursor(curser)
