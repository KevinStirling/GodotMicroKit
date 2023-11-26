extends Node2D

@export var game_list : Array[PackedScene]  
@onready var transition_timer = $TransitionTimer
@onready var transition_animation_player = $TransitionVisuals/Transition/AnimationPlayer
@onready var victory_label = $TransitionVisuals/Transition/VictoryLabel
@onready var defeat_label = $TransitionVisuals/Transition/DefeatLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	transition_timer.timeout.connect(start_transition)
	transition_timer.start()

func start_transition():
	victory_label.visible = false
	defeat_label.visible = false
	var next_game = game_list.pick_random()
	var scene : MicroGame = next_game.instantiate()
	add_child(scene)
	scene.won.connect(game_won)
	scene.lost.connect(game_lost)
	transition_animation_player.play("open")
	
func game_won(scene):
	print("won")
	transition_animation_player.play("close")
	scene.queue_free()
	victory_label.visible = true
	await get_tree().create_timer(2).timeout
	start_transition()

func game_lost(scene):
	print("lost")
	transition_animation_player.play("close")
	scene.queue_free()
	defeat_label.visible = true
	await get_tree().create_timer(2).timeout
	start_transition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
