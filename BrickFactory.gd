extends Node

export (PackedScene) var Brick

const NUM_BLOCKS = 3
const OFFSET = 150

func _ready():
	for block_id in range(NUM_BLOCKS):
		_create_brick(block_id)

func _process(data):
	pass

func _create_brick(id: int):
	var new_brick = Brick.instance()
	new_brick.position = Vector2(id * OFFSET, 0)
	add_child(new_brick)
