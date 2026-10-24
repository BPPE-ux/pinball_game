extends ProgressBar

var max_level = false

func _ready() -> void:
	max_value = Global.calculate_level()
	Global.level_up.connect(_on_level_up)
	Global.max_level.connect(_is_max_level)

func _on_level_up(_new_level: int) -> void:
	max_value = Global.calculate_level()

func _is_max_level(_max_level: bool) -> void:
	max_level = true
	value = max_value
	Global.max_level.disconnect(_is_max_level)

func _process(_delta: float) -> void:
	if !max_level:
		value = Global.score
