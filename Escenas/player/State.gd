extends Node
class_name State

var speed = 120
var direction = 0.0
var jump = 250

var states
var current_state

func _init():
	states= {
		"appear": AppearState,
		"idle": IdleState,
		"run": RunState,
		"jump": JumpState,
		"fall": FallState,
	}

func change_state(new_state_name):
	if get_child_count() !=0:
		get_child(0).queue_free()
	current_state = states.get(new_state_name).new()
	current_state.name = new_state_name
	add_child(current_state)



