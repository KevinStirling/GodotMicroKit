extends Node2D

@onready var parent_node = get_parent()
@onready var click_area = $ClickArea

var draggable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	click_area.mouse_entered.connect(mouse_entered_drag_area)
	click_area.mouse_exited.connect(mouse_exited_drag_area)

func mouse_entered_drag_area():
	draggable = true
	print("draggable")
	
func mouse_exited_drag_area():
	draggable = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable && Input.is_action_pressed("left_click"):
		parent_node.position = get_global_mouse_position()
