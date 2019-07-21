extends Node2D

signal drone_hit

func _on_Drone_body_entered(body):
	if body.is_in_group("game_over"):
		emit_signal("drone_hit")
