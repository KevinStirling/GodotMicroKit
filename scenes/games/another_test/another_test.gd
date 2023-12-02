extends MicroGame

@onready var goal = $goal

func _ready():
	goal.area_entered.connect(_on_area_entered)
	start_game()

func _on_area_entered(area):
	game_won()
