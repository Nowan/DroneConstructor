extends Node

export (PackedScene) var Brick

const NUM_BLOCKS = 3
const SPACING = 100
const OFFSET = 600

var watchers = []

func _ready():
	for block_id in range(NUM_BLOCKS):
		watchers.append(create_watcher(block_id))
		create_brick(block_id)

func _process(data):
	for block_id in range(NUM_BLOCKS):
		if !watchers[block_id].is_colliding():
			create_brick(block_id)

func create_watcher(id: int):
	var new_watcher = RayCast2D.new()
	new_watcher.position = Vector2(get_position(id), 500)
	new_watcher.cast_to = Vector2(0, 99)
	new_watcher.collision_mask = 1 | 4
	new_watcher.enabled = true
	add_child(new_watcher)
	return new_watcher

func create_brick(id: int):
	var new_brick = Brick.instance()
	new_brick.position = Vector2(OFFSET + id * SPACING, 599)
	add_child(new_brick)

func get_position(id: int):
	return OFFSET + id * SPACING