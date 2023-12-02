extends Node2D
class_name MicroGame

@export var time_limit = 5.0
@export var game_end_timer : Timer
@export var countdown_length : float = 3.0

var game_start_countdown = Timer.new()

signal won(scene)
signal lost(scene)

# Called when the node enters the scene tree for the first time.
func _ready():
	start_game()
	
func start_game():
#	3 second countdown to start game
	await get_tree().create_timer(countdown_length).timeout
	print("starting")
	game_end_timer.timeout.connect(game_lost)
	add_child(game_end_timer)
	game_end_timer.start()


func game_won():
	won.emit(self)
	
func game_lost():
	lost.emit(self)

