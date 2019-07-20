extends Node;

export (PackedScene) var TowerBlock

func _input(event):
	if event.is_action_pressed("click"):
		var tower_block = TowerBlock.instance()
		tower_block.position = get_viewport().get_mouse_position()
		add_child(tower_block)