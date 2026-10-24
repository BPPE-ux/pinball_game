extends Label


func _ready() -> void:
	self.text = str(Global.level)
	Global.level_up.connect(_on_level_up)

func _on_level_up(_new_level: int) -> void:
	self.text = str(Global.level)
