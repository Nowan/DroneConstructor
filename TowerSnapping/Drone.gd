extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(dt):
	if Input.is_action_pressed("ui_up"):
		set_applied_force(Vector2(0, -300));
	else:
		set_applied_force(Vector2(get_applied_force().x, 0));
	
	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
		set_applied_force(Vector2(-300 if Input.is_action_pressed("ui_left") else 300, get_applied_force().y));
	else:
		set_applied_force(Vector2(0, get_applied_force().y));
	
	print(get_applied_force());
		