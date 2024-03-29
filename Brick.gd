extends RigidBody2D

export (PackedScene) var Brick

const UNIT_SIZE = 10
const MAX_BRICKS = 8
const MAX_DIM_DIFF = 3
const MASS_BASE = 0.38
const MASS_COEFF = 0.19

onready var collision = get_node("Collision")
onready var sprite = get_node("Sprite")

var area = 0

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

	sprite.region_rect.size .x = width * 22
	sprite.region_rect.size .y = height * 22;
	
	area = width * height
	
	self.mass = MASS_BASE + area * MASS_COEFF

func _on_Brick_body_entered(body):
	get_node("HitSound").playing = true
