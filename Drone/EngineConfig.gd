extends RigidBody2D

const FORCE_MULTIPLIER = 2
const MAX_ACCELERATION = -350
const MAX_DEFFERING = 350

func _set_calculated_force(engineSide, engineStatus):
	var appliedForce = Vector2(0,engineStatus)
	set_applied_force(appliedForce.rotated(global_rotation))
	print("Current " +engineSide + "Engine status: ", engineStatus)
	#print("Rotation R: ", global_rotation)
