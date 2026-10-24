class_name Coin_Ball
extends RigidBody2D

@export var ball_score_vaule := 20.0
@export var ball_Score_multiplier := 1.0

func got_hit() -> void:
	Global.add_score(ball_score_vaule * ball_Score_multiplier)

@onready var Coin_scene = preload("res://scenes/table/coin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = Timer.new()
	timer.wait_time = 1.5 # Time in seconds
	timer.one_shot = false # Repeat mode
	timer.autostart = true
	
	timer.timeout.connect(_on_repeat_action)
	add_child(timer)

func _on_repeat_action() -> void:
	var coin_instance = Coin_scene.instantiate()
	get_tree().get_first_node_in_group("pinball_machine").add_child(coin_instance)
	coin_instance.global_position = global_position
	
