extends Node2D

export (PackedScene) var Link

const LENGTH = 5

var links = []
var joints = []

func _ready():
	for link_id in range(LENGTH):
		var new_link = Link.instance()
		var width = new_link.get_node("CollisionShape2D").shape.extents.x * 2
		new_link.position = Vector2(link_id * width, 0)
		
		if link_id == LENGTH - 1:
			new_link.mass = 0.3
		
		add_child(new_link)
		links.append(new_link)
		
		if link_id > 0:
			links[link_id - 1].get_node("PinJoint2D").node_b = new_link.get_path()

func create_link():
	pass
	
func _process(data):
	pass