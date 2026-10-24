class_name Duplicate_Ball
extends RigidBody2D

@export var ball_score_vaule := 20.0
@export var ball_Score_multiplier := 1.0

func got_hit() -> void:
	Global.add_score(ball_score_vaule * ball_Score_multiplier)

@onready var duplicate_ball_scene = preload("res://scenes/balls/duplicate_ball.tscn")
@onready var orginal_node = $"."
var hit = 0
var max_amount = 10
# Called when the  node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	if body.name == "Bumper" && Global.active_duplicates.size() < max_amount:
		var duplicate_node = duplicate_ball_scene.instantiate()
		duplicate_node.position = orginal_node.position - Vector2(-10,0)
		#duplicate_node.apply_central_impulse(Vector2(-100,-200))
		Global.active_duplicates.append(duplicate_node)
		duplicate_node.tree_exited.connect(Global.active_duplicates.erase.bind(duplicate_node))
		#finds what ball left with tree_exited and connect to a callable, erase, bind so it we now the 
		#arg as soon as it happens
		get_tree().get_first_node_in_group("pinball_machine").call_deferred("add_child", duplicate_node)
		#print(Global.active_duplicates.size())
