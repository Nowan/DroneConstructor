extends RigidBody2D

onready var body = get_parent().get_node("Core");

var MAX_TURBINE_VELOCITY = 100;
var JOY_AXIS_MULTIPLIER = 20;

var turbine_velocity = 0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("left_engine_accelerate"):
		var joy_axis = Vector2(0, Input.get_joy_axis(0, JOY_AXIS_1)).y;
		turbine_velocity = min(turbine_velocity - joy_axis * JOY_AXIS_MULTIPLIER, MAX_TURBINE_VELOCITY);
	
	if Input.is_action_pressed("left_engine_decellerate"):
		var joy_axis = Vector2(0, Input.get_joy_axis(0, JOY_AXIS_1)).y;
		turbine_velocity = max(turbine_velocity + joy_axis * JOY_AXIS_MULTIPLIER, 0);
	
	if body:
		set_applied_force(Vector2(-turbine_velocity * sin(body.rotation), -turbine_velocity * cos(body.rotation)));
	
	print(turbine_velocity, get_applied_force());
	#	
#if Input.is_action_pressed("left_engine_accelerate"):
#		#print(Input.get_joy_axis(0, JOY_AXIS_1));
#		var force = Input.get_joy_axis(0, JOY_AXIS_1) * 300;
#		set_applied_force(Vector2(force * sin(body.rotation), force * cos(body.rotation)));
#		print(get_applied_force());
#	if Input.is_action_pressed("left_engine_decelerate"):
#		#print(Input.get_joy_axis(0, JOY_AXIS_1));
#		var force = Input.get_joy_axis(0, JOY_AXIS_1) * 300;
#		set_applied_force(Vector2(force * sin(body.rotation), force * cos(body.rotation)));