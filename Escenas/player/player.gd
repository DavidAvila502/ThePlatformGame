extends CharacterBody2D
class_name Player

var state
var gravity = 9
var health = 100
@onready var animation = $AnimatedSprite2D

func _ready():
	state = State.new()
	state.name = "State"
	add_child(state)
	if not is_on_floor():
		state.change_state("fall")
	else:
		state.change_state("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity
	move_and_slide()

func takeDamage(damage,enemyDirection):
	health -= damage
