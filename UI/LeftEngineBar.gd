extends TextureProgress
onready var engineCoreConfig = get_node("/root/EngineConfig")
onready var engineData = get_node("/root/EngineLeft")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	min_value = engineCoreConfig.MAX_DEFFERING
	max_value = engineCoreConfig.MAX_ACCELERATION

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = engineData.engineStatus