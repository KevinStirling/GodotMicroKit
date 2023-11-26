extends Node2D
class_name MicroGame

@onready var goal = $goal
@onready var game_end_timer_display = $HUD/CanvasLayer/GameEndTimerDisplay
@onready var game_end_timer = $GameEndTimer

var game_start_countdown = Timer.new()

signal won(scene)
signal lost(scene)

# Called when the node enters the scene tree for the first time.
func _ready():
	goal.area_entered.connect(_on_area_entered)
# Display goal of game here
	await get_tree().create_timer(2).timeout
	start_game()
	
func start_game():
	game_end_timer.timeout.connect(game_lost)
	game_end_timer.start()

func _on_area_entered(area):
	game_won()
	print("bingbong")
	
func game_won():
	won.emit(self)
	
func game_lost():
	lost.emit(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_end_timer_display.text = str(int(game_end_timer.time_left))
	pass
