extends Button

@export var ball_script: Script
@export var upgrade_id: int

func _ready() -> void:
	_update_text()

func _on_pressed() -> void:
	ball_script.buy_upgrade(upgrade_id)
	_update_text()

func _update_text() -> void:
	text = "Value $%d" % ball_script.get_cost(upgrade_id)
