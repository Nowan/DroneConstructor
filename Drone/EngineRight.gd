extends RigidBody2D

func _physics_process(delta):
	if Input.is_action_pressed("right_engine_accelerate"):
		set_applied_force(Vector2(0, Input.get_joy_axis(0, JOY_AXIS_3) * 300))
	if Input.is_action_pressed("right_engine_decelerate"):
		set_applied_force(Vector2(0, Input.get_joy_axis(0, JOY_AXIS_3) * 300))
#
#const FORCE_MULTIPLIER = 5
#const MAX_ACCELERATION = -1000
#const MAX_DEFFERING = 1000
#var engineStatus = 0
## Declare member variables here. Examples:
## var a = 2
## var b = "text"
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#	if Input.is_action_pressed("right_engine_accelerate"):
#		var acceleration = Input.get_joy_axis(0, JOY_AXIS_3) * FORCE_MULTIPLIER
#		if engineStatus + acceleration < MAX_ACCELERATION:
#			acceleration = MAX_ACCELERATION - engineStatus
#		engineStatus += acceleration
#		set_applied_force(Vector2(0, engineStatus))
#		print("Current Right Engine status: %f", engineStatus)
#	if Input.is_action_pressed("right_engine_deffering"):
#		var deffering = Input.get_joy_axis(0, JOY_AXIS_3) * FORCE_MULTIPLIER
#		if engineStatus + deffering > MAX_DEFFERING:
#			deffering = MAX_DEFFERING - engineStatus
#		engineStatus += deffering
#		set_applied_force(Vector2(0, engineStatus))
#		print("Current Right Engine status: %f", engineStatus)
##	pass