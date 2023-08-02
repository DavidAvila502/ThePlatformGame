extends CharacterBody2D
class_name Player

var state
var gravity = 9
var health = 100
@onready var animation = $AnimatedSprite2D
@onready var appearsSound = $appearSound
@onready var jumpSound = $jumpSound

func _ready():
	state = State.new()
	state.name = "State"
	add_child(state)
	state.change_state("appear")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity
	move_and_slide()

func takeDamage(damage,enemyDirection,impact):
	health -= damage
	
	takeImpact(impact,enemyDirection)
	
func takeImpact(impact,enemyDirection):
	velocity.y -= impact
	velocity.x -= impact * enemyDirection


