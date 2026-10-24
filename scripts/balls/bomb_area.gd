extends Area2D

@export var explosion_time = 3.0
@export var explosing_impact = 500
@onready var parent_node = $".."

func _on_explosion_timer_timeout() -> void:
	#print("times up")
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.is_in_group("Balls") && body.name != "bomb_ball":
			#print(body.name, " explode")
			body.apply_central_impulse(Vector2(0,-explosing_impact))
	#print("explode")
	parent_node.queue_free()
