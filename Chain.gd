extends Node2D

export (PackedScene) var Hook
export (PackedScene) var Link

const LENGTH = 7

var links = []
var hook

func _ready():
	for link_id in range(LENGTH):
		var new_link = Link.instance()
		var width = new_link.get_node("CollisionShape2D").shape.extents.x * 2
		new_link.position = Vector2(link_id * width, 0)
		new_link.collision_layer = 1
		new_link.collision_mask = 1 | 2 | 3 | 4
		
		if link_id == LENGTH - 1:
			hook = Hook.instance()
			hook.position = Vector2(link_id * width + width / 2, 0)
			add_child(hook)
			new_link.get_node("PinJoint2D").node_b = hook.get_path()
		
		add_child(new_link)
		links.append(new_link)
		
		if link_id > 0:
			links[link_id - 1].get_node("PinJoint2D").node_b = new_link.get_path()

func create_link():
	pass
	
var is_full = false
	
func _physics_process(dt):
	var joint = hook.get_node("PinJoint2D")
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_full:
			joint.set_node_b(NodePath());
			is_full = false;
		else:
			var sensor = hook.get_node("HandSensor")
			# HandSensor detects only TowerBlock layer
			var tower_blocks = sensor.get_overlapping_bodies();
			if tower_blocks.size() > 0:
				var tower_block = tower_blocks[0];
				print(tower_block);
				joint.set_node_b(tower_block.get_path());
				is_full = true;
