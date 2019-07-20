extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("left_engine_accelerate"):
		print(Input.get_joy_axis(0, JOY_AXIS_1));
		set_applied_force(Vector2(0, Input.get_joy_axis(0, JOY_AXIS_1) * 300))
	if Input.is_action_pressed("left_engine_decelerate"):
		print(Input.get_joy_axis(0, JOY_AXIS_1));
		set_applied_force(Vector2(0, Input.get_joy_axis(0, JOY_AXIS_1) * 300))