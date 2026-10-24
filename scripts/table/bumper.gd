extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



func _on_body_entered(body: Node):
	if body.is_in_group("Balls"):
		body.got_hit()
		body.apply_central_impulse(Vector2(0,-200))
