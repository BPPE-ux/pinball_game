class_name Bomb_Ball
extends RigidBody2D

@export var ball_score_vaule := 20.0
@export var ball_Score_multiplier := 1.0

func got_hit() -> void:
	Global.add_score(ball_score_vaule * ball_Score_multiplier)
