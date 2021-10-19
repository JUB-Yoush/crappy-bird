extends Node2D
var speed = -200
onready var pipes = $PipesArea
onready var notifier = $VisibilityNotifier2D
onready var Main = get_parent()
#onready var player = Main.get_child("Player")
signal hit_player
signal player_scored

func _ready() -> void:
	var pipeHeight = rand_range(-200,200)
	position.y = pipeHeight
	connect("hit_player",get_parent(),"_player_hit_pipe")
	connect("hit_player",get_parent().get_node("Player"),"_player_hit_pipe")
	connect("player_scored",get_parent(),"_player_passed_pipe")
	
func _physics_process(delta: float) -> void:
	position.x += speed * delta


func _on_PipesArea_area_entered(area: Area2D) -> void:
	emit_signal("hit_player")


func _on_ScoreZone_area_entered(area: Area2D) -> void:
	emit_signal("player_scored")


func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()
