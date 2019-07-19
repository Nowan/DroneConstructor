extends Node

func _process(dt):
	var mouse_position = get_viewport().get_mouse_position();
	self.position.x = mouse_position.x;
	self.position.y = mouse_position.y;