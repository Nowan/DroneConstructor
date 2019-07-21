extends Node2D

signal drone_with_chain_hit

func _ready():
	var chain = get_node("Chain")
	var joint = get_node("PinJoint2D")

	joint.node_b = chain.links[0].get_path()

func _on_Drone2_drone_hit():
	emit_signal("drone_with_chain_hit")
