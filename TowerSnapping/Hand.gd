extends Node2D

onready var sensor = get_node("HandSensor");
onready var joint = get_node("HandJoint");

var is_full = false;

func _physics_process(dt):
	if Input.is_action_just_pressed("ui_select"):
		if is_full:
			joint.set_node_b(NodePath());
			is_full = false;
		else:
			# HandSensor detects only TowerBlock layer
			var tower_blocks = sensor.get_overlapping_bodies();
			if tower_blocks.size() > 0:
				var tower_block = tower_blocks[0];
				print(tower_block);
				joint.set_node_b(tower_block.get_path());
				is_full = true;