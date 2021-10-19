extends KinematicBody2D

onready var hurtbox = $HurtBox/CollisionShape2D
onready var collisionShape = $CollisionShape2D
onready var pipeClear = $PipeClear/CollisionShape2D



var gravity = 475
var jump_str = -250
var velocity = Vector2.ZERO
var game_start = false
var game_ended = false
signal got_hit
signal passed_pipe

func _physics_process(delta: float) -> void:
	if game_start == true:
		velocity.y += gravity * delta
		if velocity.y >= 400:
			velocity.y = 400
		if Input.is_action_just_pressed("jump") and !game_ended:
			velocity.y = jump_str
		move_and_slide(velocity)




func _hit_pipe(body: Node) -> void:
	print("ow")


func _cleared_pipe(body: Node) -> void:
	emit_signal("passed_pipe")

func _player_hit_pipe():
	game_ended = true
	#collisionShape.set_deferred("disabled",true) 
	hurtbox.set_deferred("disabled",true) 
	pipeClear.set_deferred("disabled",true) 
	velocity.y = 0
	print("Hit Pipe")


func _on_Ground_body_entered(body: Node) -> void:
	_player_hit_pipe()
	print("working?")
