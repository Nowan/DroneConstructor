extends Node

signal drone_with_chain_hit

func _ready():
	var chain = get_node("Chain")
	var joint = get_node("PinJoint2D")

	joint.node_b = chain.links[0].get_path()


func _on_Drone2_drone_hit():
	emit_signal("drone_with_chain_hit")

func show_game_over():
	find_node("Drone2").find_node("GameOverLabel").visible = true