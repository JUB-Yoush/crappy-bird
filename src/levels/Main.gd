extends Node2D

onready var PipesScene = preload("res://src/enviroment/Pipes.tscn")
onready var player = $Player
onready var pipeTimer = $PipeTimer
onready var scoreLabel = $Control/ScoreLabel
onready var startScreen = $Control/StartScreen
onready var game_start = false

signal game_start

var score = 0

func _ready() -> void:
	pass

func start_game() -> void:
	pipeTimer.start()
	startScreen.hide()
	player.game_start = true


func _on_PipeTimer_timeout() -> void:
	var pipe = PipesScene.instance()
	add_child(pipe)
	#pipe.pipes.connect("area_entered",get_parent(),"on_pipe_area_entered")
	
	
	
	
#func on_pipe_area_entered(area: Area2D) -> void:
#	print("player hit area")

#func _on_Player_passed_pipe() -> void:
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and game_start == false:
		start_game()
		game_start = true
	pass

	
func _player_hit_pipe() -> void:
	pass

func _player_passed_pipe() -> void:
	score += 1
	scoreLabel.text = str(score)
	print("Score: ",score)



