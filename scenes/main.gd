extends Node2D

@export var game_list : Array[PackedScene]  
@export var randomize_game_order : bool = true

@onready var transition_timer = $TransitionTimer
@onready var transition_animation_player = $TransitionVisuals/Transition/AnimationPlayer
@onready var victory_label = $TransitionVisuals/Transition/VictoryLabel
@onready var defeat_label = $TransitionVisuals/Transition/DefeatLabel
@onready var game_end_timer_display = $Hud/CanvasLayer/GameEndTimerDisplay

var current_game : MicroGame

func _ready():
	transition_timer.timeout.connect(start_transition)
	transition_timer.start()

func start_transition():
	var next_game : PackedScene
	victory_label.visible = false
	defeat_label.visible = false
	if randomize_game_order:
		next_game = game_list.pick_random()
	else:
		next_game = game_list.pop_front()
	current_game = next_game.instantiate()
	add_child(current_game)
	current_game.won.connect(game_won)
	current_game.lost.connect(game_lost)
	transition_animation_player.play("open")
	
func game_won(scene):
	transition_animation_player.play("close")
	scene.queue_free()
	victory_label.visible = true
	await get_tree().create_timer(2).timeout
	start_transition()

func game_lost(scene):
	transition_animation_player.play("close")
	scene.queue_free()
	defeat_label.visible = true
	await get_tree().create_timer(2).timeout
	start_transition()

func _process(delta):
	if current_game != null:
		game_end_timer_display.text = str(int(current_game.game_end_timer.time_left))
