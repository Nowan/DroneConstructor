extends Node

func _ready():
	var chain = get_node("Chain")
	var joint = get_node("PinJoint2D")

	joint.node_b = chain.links[0].get_path()
