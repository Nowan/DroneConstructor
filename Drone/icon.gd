extends Sprite

func _process(delta):
	if Input.is_action_pressed("left_engine_accelerate"):
		print(Input.get_joy_axis(0, JOY_AXIS_1))
		position.y += Input.get_joy_axis(0, JOY_AXIS_1) * 10
		position.x -= Input.get_joy_axis(0, JOY_AXIS_1) * 10
	if Input.is_action_pressed("left_engine_deffering"):
		print(Input.get_joy_axis(0, JOY_AXIS_1))
		position.y += Input.get_joy_axis(0, JOY_AXIS_1) * 10
		position.x -= Input.get_joy_axis(0, JOY_AXIS_1) * 10
	if	Input.is_action_pressed("right_engine_accelerate"):
		print(Input.get_joy_axis(0, JOY_AXIS_3))
		position.y += Input.get_joy_axis(0, JOY_AXIS_3) * 10
		position.x += Input.get_joy_axis(0, JOY_AXIS_3) * 10
	if	Input.is_action_pressed("right_engine_deffering"):
		print(Input.get_joy_axis(0, JOY_AXIS_3))
		position.y += Input.get_joy_axis(0, JOY_AXIS_3) * 10
		position.x += Input.get_joy_axis(0, JOY_AXIS_3) * 10