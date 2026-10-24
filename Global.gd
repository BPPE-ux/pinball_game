extends Node

const base_level_thresholds : float = 100.0
const level_growth : float = 1.15
const MAX_LEVEL : int = 25

signal level_up(new_level: int)
signal max_level(max_level: bool)
var score := 0.0
var level := 1

var active_duplicates: Array = [] # <- for the duplicate ball

func calculate_level() -> float:
	return base_level_thresholds * pow(level_growth, level - 1)
func add_score(amount: float) -> void:
	if level >= MAX_LEVEL:
		max_level.emit(true)
		return
	score += amount
	while score >= calculate_level():
		score -= calculate_level()
		level += 1
		level_up.emit(level)
		print(level)
