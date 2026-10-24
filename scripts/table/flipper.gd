extends Node2D

@export var left_rotation: float = 0.0
@export var right_rotation: float = 0.0

@onready var flipper_right: RigidBody2D = $Flipper2
@onready var flipper_left: RigidBody2D = $Flipper
const SPEED := 850.0
const MAX_ANGLE := 45.0
const MIN_ANGLE := 15.0

func _physics_process(delta: float) -> void:
	var left_dir := -1.0 if Input.is_action_pressed("Left Flipper") else 1.0
	var right_dir := 1.0 if Input.is_action_pressed("Right Flipper") else -1.0

	left_rotation = clampf(left_rotation + SPEED * delta * left_dir, -MAX_ANGLE, MIN_ANGLE)
	right_rotation = clampf(right_rotation + SPEED * delta * right_dir, -MIN_ANGLE, MAX_ANGLE)

	flipper_left.rotation_degrees = left_rotation
	flipper_right.rotation_degrees = right_rotation


func _on_button_pressed() -> void:
	pass # Replace with function body.
