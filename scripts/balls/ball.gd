#class_name Ball
extends RigidBody2D

const base_ball_score_vaule := 20.0
const base_ball_Score_multiplier := 1.0

static var score_bonus = 0.0
static var score_bouns_multiplier = 0.0

static var upgrade_one_cost = 10.0
static var upgrade_two_cost = 100.0
# Called when the node enters the scene tree for the first time.

var ball_score_vaule: float:
	get:
		return base_ball_score_vaule + score_bonus

var ball_Score_multiplier: float:
	get:
		return base_ball_Score_multiplier + score_bouns_multiplier

func got_hit():
	var gained := ball_score_vaule * ball_Score_multiplier
	print(gained)
	Global.add_score(gained)

static func buy_upgrade(id: int):
	match  id:
		1:
			score_bonus += 1
			upgrade_one_cost += 1
		2:
			score_bouns_multiplier += 0.1
			upgrade_two_cost += 25
		_:
			push_warning("unknown upgrade id %d" % id)

static func get_cost(id: int):
	match  id:
		1:
			return upgrade_one_cost
		2:
			return upgrade_two_cost
		_:
			push_warning("unknown upgrade id %d" % id)
