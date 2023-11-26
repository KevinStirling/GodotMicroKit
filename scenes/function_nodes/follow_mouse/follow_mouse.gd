extends Node2D

@export var lerp_speed = 1
@export var hide_mouse = false

@onready var parent_sprite = get_parent()

# idk why this doesnt work
func _get_configuration_warnings() -> PackedStringArray:
	if parent_sprite is Sprite2D :
		return []
	return ["Must be attached to a Sprite2D node!"]

# Called when the node enters the scene tree for the first time.
func _ready():
	if hide_mouse:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parent_sprite.position = lerp(position, get_global_mouse_position(), lerp_speed)
