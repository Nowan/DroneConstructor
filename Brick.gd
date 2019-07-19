extends Node

export (PackedScene) var Brick

const UNIT_SIZE = 10
const MAX_BRICKS = 8
const MAX_DIM_DIFF = 3

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
	
	var body = get_node("Body")
	var collision = body.get_node("Collision")
	var color = body.get_node("ColorRect")
	
	collision.shape.extents.x = width * UNIT_SIZE
	collision.shape.extents.y = height * UNIT_SIZE

	color.margin_left = -width * UNIT_SIZE
	color.margin_right = width * UNIT_SIZE
	color.margin_top = -height * UNIT_SIZE
	color.margin_bottom = height * UNIT_SIZE
