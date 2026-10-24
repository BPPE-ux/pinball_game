extends  TextureRect

@export var card_frame: TextureRect
@export var ball_scene: PackedScene
@export var unlock_level: int
#@onready var main_scene = owner

var hovering: bool
func _ready() -> void:
	card_frame.pivot_offset = card_frame.size / 2
	
func _process(_delta):
	if  is_mouse_over_card():
		hovering = true
		card_frame.scale = Vector2(1.2,1.2)
	else:
		hovering = false
		card_frame.scale = Vector2(1,1)

func is_mouse_over_card() -> bool:
	return card_frame.get_global_rect().has_point(get_global_mouse_position())


func _input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and unlock_level <= Global.level:
		if event.pressed and hovering:
			var ball_instance = ball_scene.instantiate()
			get_tree().get_first_node_in_group("pinball_machine").add_child(ball_instance)
			ball_instance.global_position = Vector2(160,80)
