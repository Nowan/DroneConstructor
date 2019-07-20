extends "res://Drone/EngineConfig.gd"

var engineStatus = 0
var engineMemoryStatus = 0

func _ready():
	pass # Replace with function body.

# Called every frame.
func _integrate_forces(state):
	engineStatus = engineMemoryStatus

	if Input.is_action_pressed("left_engine_accelerate"):
		var acceleration = Input.get_joy_axis(0, JOY_AXIS_1) * FORCE_MULTIPLIER
		if engineStatus + acceleration < MAX_ACCELERATION:
			acceleration = MAX_ACCELERATION - engineStatus
		engineStatus += acceleration
	if Input.is_action_pressed("left_engine_deffering"):
		var deffering = Input.get_joy_axis(0, JOY_AXIS_1) * FORCE_MULTIPLIER
		if engineStatus + deffering > MAX_DEFFERING:
			deffering = MAX_DEFFERING - engineStatus
		engineStatus += deffering
	engineMemoryStatus = engineStatus

	if Input.is_action_pressed("left_engine_culvert_change"):
		engineMemoryStatus = engineStatus
		engineStatus = engineStatus * -1
	if Input.is_action_pressed("left_engine_power_off"):
		engineMemoryStatus = engineStatus
		engineStatus = 0

	_set_calculated_force("Left", engineStatus)