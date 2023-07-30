extends State
class_name FallState

var Player

func _ready():
	Player = get_parent().get_parent()
	
func _physics_process(delta):
	Player.animation.flip_h =  direction < 0 if direction != 0 else Player.animation.flip_h
	Player.animation.play("fall")
	
	if Input.is_action_pressed("d"):
		direction = 1
		Player.velocity.x = direction * speed

	if Input.is_action_pressed("a"):
		direction = -1
		Player.velocity.x = direction * speed

	if Player.is_on_floor():
		if Input.is_action_pressed("a") || Input.is_action_pressed("d"):
			get_parent().change_state("run")
		else:
			get_parent().change_state("idle")

