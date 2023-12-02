extends MicroGame

@export var goal : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	goal.area_entered.connect(_on_area_entered)
	start_game()

func _on_area_entered(area):
	game_won()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
