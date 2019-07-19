extends Node

export (PackedScene) var Brick

func _input(event):
	if event.is_action_pressed("click"):
		var new_brick = Brick.instance()
		new_brick.position = get_viewport().get_mouse_position()
		add_child(new_brick)
