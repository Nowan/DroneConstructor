extends Node2D

export (PackedScene) var Brick

const UNIT_SIZE = 10
const MAX_BRICKS = 8
const MAX_DIM_DIFF = 3

onready var collision = get_node("Collision")
onready var color = get_node("ColorRect")

func _ready():
	randomize()
	
	var max_height = 1
	for h in range(MAX_BRICKS):
		if h * (h - MAX_DIM_DIFF) <= MAX_BRICKS:
			max_height = h
		else:
			break
	
	var height = randi() % max_height + 1
	var min_width = max(height - MAX_DIM_DIFF, 1)
	var max_width = min(height + MAX_DIM_DIFF, int(MAX_BRICKS / height))
	var width = randi() % (max_width - min_width + 1) + min_width
	
	var collision_shape = RectangleShape2D.new()
	collision_shape.extents.x = width * UNIT_SIZE
	collision_shape.extents.y = height * UNIT_SIZE
	collision.shape = collision_shape

	color.margin_left = -width * UNIT_SIZE
	color.margin_right = width * UNIT_SIZE
	color.margin_top = -height * UNIT_SIZE
	color.margin_bottom = height * UNIT_SIZE

var pressed = false

func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton:
		pressed = event.pressed
	elif event is InputEventMouseMotion:
		if false:
			#collision.position = event.position
			#color.position = event.position
			var force = event.global_position - self.position
			print(force)
			self.applied_force = 100 * force

func _process(data):
	if pressed:
		var force = get_viewport().get_mouse_position() - self.position
		#print(force)
		self.applied_force = force
	else:
		self.applied_force = Vector2(0, 0)
