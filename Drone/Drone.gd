extends Node

func _on_Drone_body_entered(body):
	print("coll")
	get_node("GameOverSound").playing = true
